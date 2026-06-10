(
s.waitForBoot({
    var masterScore;

    // --------------------------------------------------------------------
    // PRE-SETUP: BUS ROUTING & GROUPS
    // --------------------------------------------------------------------
    ~synthBus = Bus.audio(s, 2);
    s.sync;

    // --------------------------------------------------------------------
    // 0. SAFETY FIRST: PERSISTENT MASTER LIMITER
    // --------------------------------------------------------------------
    SynthDef(\safetyLimiter, {
        var sig = In.ar(0, 2);
        sig = Limiter.ar(sig, level: 0.85, dur: 0.01);
        ReplaceOut.ar(0, sig);
    }).add;

    s.sync;

    ServerTree.removeAll;
    ServerTree.add({ Synth.tail(RootNode(s), \safetyLimiter) });
    if(s.serverRunning) { Synth.tail(RootNode(s), \safetyLimiter) };

    // --------------------------------------------------------------------
    // 1. INSTRUMENTS & SYNTHS (Node Safe)
    // --------------------------------------------------------------------

    // Movement II: The Scald
    SynthDef(\scaldHiss, { |out=0, amp=1|
        var env = EnvGen.ar(Env.perc(0.01, 2.5, 1, -6), doneAction: 2);
        var sig = WhiteNoise.ar;
        sig = BPF.ar(sig, XLine.kr(9000, 1500, 2.5), 0.15);
        Out.ar(out, Pan2.ar(sig * env * amp * 8, 0));
    }).add;

    // Movement II: Dry physical modeling impulses
    SynthDef(\crumbleClick, { |out=0, freq=2000, decayTime=0.1, amp=0.5, pan=0|
        var env = EnvGen.ar(Env.perc(0.001, decayTime + 0.02), doneAction: 2);
        var exciter = WhiteNoise.ar * EnvGen.ar(Env.perc(0.001, 0.005));
        var sig = Ringz.ar(exciter, freq, decayTime);
        Out.ar(out, Pan2.ar(sig * env * amp, pan));
    }).add;

    // Movement III: Wave-folded subtractive bass
    SynthDef(\squelchBass, { |out=0, freq=55, foldAmount=2, amp=0.6|
        var env = EnvGen.ar(Env.perc(0.02, 0.4), doneAction: 2);
        var fEnv = EnvGen.ar(Env.perc(0.01, 0.25));
        var sig = SinOsc.ar(freq);
        sig = Fold.ar(sig * foldAmount, -0.5, 0.5);
        sig = RLPF.ar(sig, freq + (fEnv * 2000), 0.3);
        Out.ar(out, Pan2.ar(sig * env * amp, 0));
    }).add;

    // Movement V: Bright Lydian Plucks
    SynthDef(\ovenPluck, { |out=0, freq=440, cutoff=3000, pan=0, amp=0.3|
        var env = EnvGen.ar(Env.perc(0.01, 0.3), doneAction: 2);
        var sig = Pulse.ar(freq, 0.5) + Saw.ar(freq * 1.005);
        sig = RLPF.ar(sig, cutoff, 0.2);
        Out.ar(out, Pan2.ar(sig * env * amp, pan));
    }).add;

    s.sync;

    // --------------------------------------------------------------------
    // 2. NDEFS & EFFECTS ARCHITECTURE
    // --------------------------------------------------------------------

    // Movement I: The Boil
    Ndef(\boilGranular, { |grainDens=5, fmIndex=1, amp=0.6|
        var trigs = Dust.ar(grainDens);
        var carFreq = LFNoise1.kr(2).exprange(200, 600);
        var modFreq = carFreq * 1.414; // Tritone-ish modulation
        var sig = GrainFM.ar(2, trigs, 0.1, carFreq, modFreq, fmIndex, LFNoise1.kr(1));
        sig * amp;
    });

    // Movement III: Liquid splashes
    Ndef(\milkSplash, { |amp=0.4|
        var trigs = Dust.kr(0.8);
        var env = EnvGen.kr(Env.perc(0.005, 0.2), trigs);
        var freq = TRand.kr(1500, 4000, trigs);
        var mod = SinOsc.ar(freq * 2.5) * TRand.kr(1, 5, trigs) * freq;
        var sig = SinOsc.ar(freq + mod) * env;
        Pan2.ar(sig * amp, TRand.kr(-0.6, 0.6, trigs));
    });

    // Movement IV: The Canastra Fold (PM Pad)
    Ndef(\canastraChords, { |amp=0.4, modIndex=1.5|
        var freqs = [261.63, 329.63, 392.00, 493.88]; // Cmaj7 Cluster
        var modFreqs = freqs * [1.059, 1.414, 1.059, 1.414]; // Min 2nd & Tritone ratios
        var sig = PMOsc.ar(freqs, modFreqs, SinOsc.kr(0.1).range(1, modIndex));
        sig = Splay.ar(sig);
        sig = LPF.ar(sig, 3000);
        sig * amp;
    });

    // Master Mixing & FX Chain
    Ndef(\masterMix, {
        var synths = In.ar(~synthBus, 2);
        var continuous = Ndef.ar(\boilGranular, 2) + Ndef.ar(\milkSplash, 2) + Ndef.ar(\canastraChords, 2);
        synths + continuous;
    });

    Ndef(\heatReverb, { |revWet=0.1|
        var in = Ndef.ar(\masterMix, 2);
        var verb = FreeVerb2.ar(in[0], in[1], mix: 1, room: 0.9, damp: 0.4);
        XFade2.ar(in, verb, revWet * 2 - 1);
    });

    Ndef(\masterGlue, {
        var in = Ndef.ar(\heatReverb, 2);
        // Compander acts as master bus glue
        var comp = Compander.ar(in, in, thresh: 0.4, slopeBelow: 1, slopeAbove: 0.3, clampTime: 0.01, relaxTime: 0.1);
        comp * 1.5;
    });

    Ndef(\masterGlue).play;
    s.sync;

    // --------------------------------------------------------------------
    // 3. THE SCRIPT (Tdef Score)
    // --------------------------------------------------------------------
    Tdef(\masterScore, {

        "0:00 - [Cue 1: The Boil (Anticipation & Heat)]".postln;
        Ndef(\boilGranular).fadeTime = 3;
        Ndef(\boilGranular).xset(\grainDens, 5, \fmIndex, 1);

        // ACTIVE WAIT: Sweeping density and FM index over 25 seconds
        25.do { |i|
            Ndef(\boilGranular).xset(
                \grainDens, 5 + (i * 4.6),
                \fmIndex, 1 + (i * 0.2)
            );
            1.wait;
        };

        "0:25 - [Cue 2: The Scald & Crumble (HARD CONTRAST)]".postln;
        // INSTANT SUBTRACTION
        Ndef(\boilGranular).stop;
        Ndef(\boilGranular).clear;

        // The Scald Impact
        Synth(\scaldHiss, [\out, ~synthBus, \amp, 1.2]);

        // The Crumble
        Pbindef(\crumbleSeq,
            \instrument, \crumbleClick,
            \out, ~synthBus,
            \dur, Pwhite(0.03125, 0.125, inf),
            \freq, Pexprand(1500, 9000, inf),
            \pan, Pwhite(-0.8, 0.8, inf),
            \decayTime, 0.1,
            \amp, 0.25
        ).play;

        // ACTIVE WAIT: Shrinking decay time to simulate lumps dissolving over 30 seconds
        30.do { |i|
            Pbindef(\crumbleSeq, \decayTime, 0.1 - (i * 0.0031));
            1.wait;
        };

        "0:55 - [Cue 3: The Knead (Viscous Rhythm)]".postln;
        Pbindef(\kneadBass,
            \instrument, \squelchBass,
            \out, ~synthBus,
            \dur, Pseq([0.25, 0.25, 0.5, 0.25, 0.75], inf),
            \midinote, Pseq([36, 36, 48, 36, 34], inf),
            \foldAmount, 2.0,
            \amp, 0.7
        ).play;

        // ACTIVE WAIT: Modulate dough stickiness (foldAmount) while milk splashes
        40.do {
            Pbindef(\kneadBass, \foldAmount, rrand(1.5, 4.5));
            1.wait;
        };

        "1:35 - [Cue 4: The Canastra Fold (Pungent Harmonics)]".postln;
        Ndef(\canastraChords).fadeTime = 8;
        Ndef(\canastraChords).xset(\amp, 0.5);
        Ndef(\heatReverb).xset(\revWet, 0.6); // Expanding the space

        // ACTIVE WAIT: Sweeping PM index for sharp flavor profile
        6.do {
            Ndef(\canastraChords).xset(\modIndex, rrand(1.5, 4.0));
            5.wait;
        };

        "2:05 - [Cue 5: The Oven (LATE-STAGE CLIMAX)]".postln;
        // SUBTRACTION & INJECTION
        Pbindef(\kneadBass).stop;
        Pbindef(\crumbleSeq).stop;

        Pbindef(\ovenArp,
            \instrument, \ovenPluck,
            \out, ~synthBus,
            \scale, Scale.lydian,
            \degree, Pseq([0, 2, 4, 6, 7, 9, 11, 13], inf),
            \octave, Pseq([4, 5, 6, 7], inf),
            \dur, 0.125,
            \cutoff, 3000,
            \pan, 0,
            \amp, 0.4
        ).play;

        // ACTIVE WAIT: Frantic expansion over 35 seconds
        35.do {
            Pbindef(\ovenArp,
                \cutoff, rrand(2000, 8000),
                \pan, rrand(-0.8, 0.8)
            );
            1.wait;
        };

        "2:40 - [Cue 6: The Golden Crust (RESOLUTION & FADE)]".postln;
        Pbindef.removeAll; // Stop all rhythmic sequences immediately

        // 20-second fade out for all continuous textures and reverb
        Ndef(\canastraChords).clear(20);
        Ndef(\milkSplash).clear(20);
        Ndef(\heatReverb).clear(20);
        Ndef(\masterGlue).clear(20);

        20.wait;

        "3:00 - [Cue 7: Silence]".postln;
        Tdef.removeAll;
        "Piece concludes.".postln;
    });

    Tdef(\masterScore).play;
});

s.makeGui;
)
