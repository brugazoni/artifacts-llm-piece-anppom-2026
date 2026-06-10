## [2026-05-29 16:45:06] USE CASE: GENERATE_PLAN | MODEL: gemini/gemini-3.1-pro-preview
**Cost & Token Usage:** In 2504 / Out 1895 | $0.03719 | 36.83s | Temp: 0.7
**Context Window:** 4399 / 2097152 (0.21%)

**Environmental Impact:**
- Energy: 0.055132 kWh
- GWP: 0.021529 kgCO2eq
- ADPE: 2.690771e-08 kgSbeq
- PE: 0.5390 MJ
- WCF: 0.243295 m3
*(Note: Measured)*

**System Guidance:**
```text
SuperCollider Absolute-Time Composition Planner

You are an expert SuperCollider composer, cinematic orchestrator, and sound designer. Your task is to take a user's prompt (text, narrative, or script) and output a precise, time-stamped Composition Plan. 
You will NOT generate any SuperCollider code yet. You will ONLY generate a structured text plan.

Planning Rules:
1. Aesthetic Scope, Valence Variety & Momentum (CRITICAL): You MUST explicitly plan for diverse emotional valences (e.g., bright, playful, triumphant, frantic, euphoric, delicate, brooding, dark, etc) matching the user's prompt. 
   - Dictate varied musical elements: utilize fast tempos, bouncy/staccato rhythms, high twinkling registers, major/Lydian harmonic arrays, and bright synthesis techniques (e.g., snappy FM plucks, bright wavetables) to achieve emotional contrast. Use noise, atonality, tonality, multiple tuning systems, spectral exploration, rhythmic density, repetition structures, self-contained phrases and so on.
   - Avoid movements that are characterized by repetition and looping of the same elements. If a movement is for instance 40 seconds long, have at least some elements conduct a complete distinctive single arc with no repetitions across the complete duration, so the movement has an identity and does not bore listeners.
   - Late-Stage Kinetic Energy: Do not default to slow drones, ambient pads, or long fade-outs for climaxes and endings unless explicitly requested by the prompt. Actively inject new, high-density, sharp, or chaotic elements in the final third of the piece to maintain momentum and prevent the composition from losing steam.
   - Movement lengths can be varied and not restricted to multiples of 5 seconds. Have shorter movements around 3 seconds, longer movements around 15 seconds or even 23 seconds. 
   - Organic movements also mean gestures that do not necessarily restrict themselves strictly to movement boundaries, occasionally bleeding through them.

2. Absolute Timeline Scripting & Micro-Pacing: You must structure the piece as a linear script using strictly absolute time (minutes and seconds) for the macro-cues (e.g., "0:00 - Cue 1", "0:15 - Cue 2"). 
   - Macro vs. Micro Pacing: Even within longer macro-cues (e.g., 20+ seconds), you must mandate micro-gestures. Do not rely on static waiting. Explicitly instruct the use of parameter randomization, complex LFO sweeps, or rapid nested event triggers so the texture remains sonically active and never feels stale.

3. Flexible Architecture & Sound Sources: List the specific architectures to be used. 
   - For continuous textures, drones, and heavy routing, plan to use JITLib (Ndefs). Let JITLib's native crossfading handle amplitude changes rather than relying on t_trig envelopes, which can cause instant cut-offs.
   - For complex rhythms, granular clouds, or discrete events, plan to use standard SynthDefs sequenced by Pbinds/Pbindefs. 
   - Push the boundaries of SuperCollider's sound design: utilize FM, chaotic generators, wave-folding, subtractive, and distortion where aesthetically appropriate.

4. Subtractive Arrangement & Dynamicity: Actively avoid the "additive arrangement" pitfall. Do not simply layer new elements indefinitely, which quickly overwhelms the stereo field and creates mud. Explicitly dictate when to cut, mute, fade out, or radically alter existing textures to create stark contrast, space, and narrative momentum. 
   - Implement the "Spotlight Rule": ensure only 1-2 broadband/complex elements dominate at any given time. 
   - If an element lingers across multiple movements, fundamentally shift its parameters (e.g., choke its filter, shorten its decay to turn a ringing tone into a dry click, or change its rhythm) so it does not overstay its welcome.

5. Modifiers & Automation: Plan out how parameters will evolve. Dictate which arguments (e.g., freqMult, indexMod, grainSize, decayTime) must be exposed so they can be dynamically automated across the timeline without overriding sequencer streams.

6. Execution of Dynamics & Fluid Gestures: Detail exactly how transitions occur. Explicitly specify if a shift is a sudden, hard snap (via .set) or an evolving crossfade/sweep (via .xset across a specified .fadeTime).

7. Effects Architecture: Describe the effect chains and how their parameters (wet/dry mix, decay times, filters) will be automated across the timeline to create movement and space. Explicitly outline any bus routing (e.g., dedicating a reverb bus) to bridge SynthDefs and FX chains.

8. Mixing & Coexistence: Instruct how the elements should be balanced to prevent frequency masking. Assume the final output will run through a strict Master Limiter (0.85); keep the mix dynamic but tightly controlled. Briefly outline Group management (e.g., ~sourceGroup vs. ~fxGroup) to ensure correct server execution order.

9. Readability: Ensure the plan is formatted neatly in Markdown as a chronological Cue Sheet.

*Note: The example below demonstrates the required FORMAT (Sections, Absolute Time Cues, Parameter details). Generate highly varied concepts based on the user's prompt.*

Example Structure:

# Composition Plan: [Title]

## 1. Macro-Structure, Valence, & Arc
* Movement I [0:00 - 0:28]: **The Ignition.** Highly rhythmic, staccato, and precise. A fast-paced, dry introduction focusing on high-frequency transients to establish immediate kinetic energy.
* Movement II [0:28 - 0:45]: **The Void (Subtractive Contrast).** A sudden drop into a dark, viscous, atonal drone. All rhythm is stripped away. The space feels massive and suddenly empty.
* Movement III [0:45 - 1:12]: **The Agitation.** Micro-gestural awakening. Pointillistic, chaotic bursts begin interrupting the void, growing exponentially in density and dissonance.
* Movement IV [1:12 - 1:40]: **Late-Stage Climax.** Euphoric, overwhelming, and highly active. Instead of fading out, a massive, harmonically rich wave-folder bass violently collides with a frantic 16th-note Lydian sequence.
* Movement V [1:40 - 1:42]: **The Snap.** An instant, brutal halt. No fade-out. Immediate silence to maximize structural shock.

## 2. Sound Sources & Architecture
* `SynthDef(\staccatoClick)` + `Pbindef(\clickSeq)`: Dry, high-register FM plucks with 0.01s decay times. Used for intense, un-reverberated rhythm.
* `Ndef(\viscousVoid)`: A complex PM (Phase Modulation) drone routed through a heavily resonant low-pass filter. 
* `Ndef(\chaoticSputter)`: A Dust-driven granular trigger executing rapid, random-pitch sine bursts to create agitation.
* `SynthDef(\waveBass)` + `Pbindef(\bassSeq)`: Aggressively wave-folded subtractive bass for the late-stage climax. 

## 3. Modifiers & Effects Architecture
* Modifiers: `\fmIndex` in the staccato clicks for brightness; `\dustDens` in the chaotic sputter to automate density; `\foldAmount` in the bass.
* Effects: `Ndef(\blackholeReverb)` on a dedicated bus. The wet mix will start at 0, spike to 0.8 during Movement II, and be bypassed instantly at the final climax for a dry, in-your-face impact.

## 4. Mixing & Arrangement Strategy
* Arrangement relies heavily on hard cuts. When the drone enters, the rhythmic sequence is killed instantly. The Master Limiter will be pushed hard during Movement IV, requiring the drone to be high-passed to make room for the wave-folder bass.

## 5. Absolute Timeline & Cue Sheet

0:00 — [Cue 1: Ignition]
* Action: Initiate `Pbindef(\clickSeq)`. 
* Dynamics: Fast, repeating 16th notes. Use a `.wait` loop (e.g., 4.do { ... }) to randomly shift the `\fmIndex` every 7 seconds, keeping the texture biting and active.

0:28 — [Cue 2: The Void (HARD CONTRAST)]
* Action: **SUBTRACTION.** Instantly `.stop` the `Pbindef(\clickSeq)`. Hard snap the `.set` wet mix of `Ndef(\blackholeReverb)` to 0.8. Introduce `Ndef(\viscousVoid)` at high amplitude.
* Dynamics: The transition must be jarring. A massive, dark space instantly replaces the dry clicking.

0:45 — [Cue 3: Agitation Injections]
* Action: Introduce `Ndef(\chaoticSputter)`. 
* Dynamics: Over the next 27 seconds, `.xset` the `\dustDens` from 2 up to 150. The void drone remains, but is slowly choked (filter cutoff sweeping downward) as the granular sputtering takes over the frequency spectrum. 

1:12 — [Cue 4: Late-Stage Overwhelm]
* Action: Initiate `Pbindef(\bassSeq)` and revive `Pbindef(\clickSeq)` with a new, chaotic Lydian scale array. 
* Dynamics: Bypass the reverb completely (hard `.set` wet mix to 0). The texture becomes aggressively dry, violently loud, and densely rhythmic. Mandate parameter randomization within the sequences so the 28-second climax is constantly shifting and never loops identically.

1:40 — [Cue 5: The Snap (TERMINATION)]
* Action: Explicitly conclude all active routines simultaneously. Command `Tdef.removeAll`, `Pbindef.removeAll`, and `Ndef.clear`. 
* Dynamics: Absolute and instant silence. No fade times. Piece concludes.
```

**User Prompt & Subtext:**
```text
User Request: Receita de Pão de Queijo da Dona Eliza
1kg de polvilho doce
1 prato fundo até no friso de óleo
1 prato fundo até no friso de leite
8 ovos
1 colher de sopa não muito cheia de sal
1 prato cheio até o friso de queijo canastra ralado (mais curado)
Modo de fazer
Colocar pra ferver o leite junto com o óleo.
Depois de fervido, escaldar o polvilho já com o sal. Assim que esfriar misturar bem com as mãos o polvilho para desencaroçar todo.
Depois que desencaroçar, colocar os ovos e amassar bastante até que a massa fique bem lisa. Pode ir colocando leite aos poucos para ficar bem lisinha.
Depois de bastante lisa, colocar o queijo e mexer bastante. Até ficar homogênea e lisa. A massa fica mais mole. (O leite vai colocando aos poucos).
Enrolar os pães de queijo com as mãos untadas com óleo, pois a massa gruda nas mãos se não colocar o óleo.
Colocar para assar em forno pré-aquecido a 180 graus por aproximadamente uns 30 a 40 minutos.

Task: Generate a composition plan proportional to the request's length. The composition MUST include an explicit ending where all Tdefs conclude, all Ndefs are cleared with a long fade, and the server is left silent. Use absolute timestamps throughout.
```

**Final Answer/Output:**
```supercollider
# Composition Plan: Pão de Queijo (The Alchemy of Dough)

## 1. Macro-Structure, Valence, & Arc
* **Movement I [0:00 - 0:25]: The Boil (Anticipation & Heat).** Fluid, warm, and rising in tension. Translates the boiling of milk and oil through bubbling granular textures and low-frequency swells. The valence is anticipatory and kinetic.
* **Movement II [0:25 - 0:55]: The Scald & Crumble (Subtractive Contrast & Texture).** A sudden, hissing shock as boiling liquid hits dry starch, followed by a frantic, dry, pointillistic section. Low frequencies are entirely subtracted. The valence is chaotic, tactile, and ASMR-like, representing the breaking up of lumps.
* **Movement III [0:55 - 1:35]: The Knead (Viscous Rhythm).** The dough comes together. A heavy, squelchy, wave-folded rhythmic bass enters, joined by sporadic, bright liquid splashes (adding milk). The valence shifts to a physical, grooving, and highly kinetic state.
* **Movement IV [1:35 - 2:05]: The Canastra Fold (Pungent Harmonics).** The addition of cured cheese introduces sharp, rich, and slightly dissonant harmonic arrays. The texture becomes dense and expansive, utilizing complex Phase Modulation to represent the sharp flavor profile.
* **Movement V [2:05 - 2:40]: The Oven (Late-Stage Kinetic Expansion).** High thermal energy and expansion. Instead of a static drone, the climax is euphoric, hot, and densely active. Frantic 16th-note arpeggios in a bright Lydian mode swirl and expand in register, simulating the dough rising and turning golden in the heat. 
* **Movement VI [2:40 - 3:00]: The Golden Crust (Resolution & Fade).** The heat dissipates. A long, controlled fade into absolute silence. 

## 2. Sound Sources & Architecture
* `Ndef(\boilGranular)`: A granular synthesizer driven by `LFNoise1` modulating `GrainFM`. Used for the bubbling, fluid textures of heating oil and milk.
* `SynthDef(\scaldHiss)`: A sharp, burst-envelope synth utilizing filtered `WhiteNoise` with a high resonance peak to simulate the sizzle of scalding starch.
* `SynthDef(\crumbleClick)` + `Pbindef(\crumbleSeq)`: Extremely short, dry physical modeling impulses (using `Klank` or `Ringz` with tiny decay times) to represent the breaking of starch lumps. 
* `SynthDef(\squelchBass)` + `Pbindef(\kneadBass)`: A wave-folded subtractive bass synth. The envelope is tightly mapped to a low-pass filter cutoff, creating a squishy, viscous "kneading" sound.
* `Ndef(\milkSplash)`: High-pitched, frequency-modulated sine bursts triggered via `Dust.kr`, simulating the gradual addition of milk.
* `Ndef(\canastraChords)`: A dense, JITLib-based PM (Phase Modulation) synth pad. Rich, slightly detuned, and harmonically complex.
* `SynthDef(\ovenPluck)` + `Pbindef(\ovenArp)`: Bright, snappy wavetable plucks for the frantic, expanding climax.

## 3. Modifiers & Effects Architecture
* **Modifiers:** 
  * `\grainDens` and `\fmIndex` in `Ndef(\boilGranular)` to automate the heat.
  * `\decayTime` in `Pbindef(\crumbleSeq)` (shortening over time to simulate lumps dissolving).
  * `\foldAmount` in the `squelchBass` to increase the "stickiness" of the dough.
* **Effects:** 
  * `Ndef(\heatReverb)`: A large, warm reverberation space on a dedicated bus. 
  * `Ndef(\masterGlue)`: A master bus compressor (using `Compander`) to keep the squelch bass and chaotic crumbles tightly balanced before hitting the Master Limiter (0.85).

## 4. Mixing & Arrangement Strategy
* **Group Management:** `~sourceGroup` will contain all discrete Synths and Pbinds, feeding into `~fxGroup` (Reverb and Compressor).
* **Subtractive Dynamicity:** The transition at 0:25 relies on instantly killing the low-end rumble of the boil to create a stark, dry, high-frequency space for the crumble. At 2:05, the heavy `squelchBass` is muted to clear the low-mid spectrum, allowing the frantic `ovenArp` to dominate the spotlight without muddying the mix.

## 5. Absolute Timeline & Cue Sheet

**0:00 — [Cue 1: The Boil]**
* **Action:** Fade in `Ndef(\boilGranular)` over 3 seconds. 
* **Dynamics:** Start with low `\grainDens` (e.g., 5 Hz). Over the next 25 seconds, use a routine to `.xset` the density up to 120 Hz and slowly sweep the `\fmIndex` upward. The texture should feel like a rolling boil.

**0:25 — [Cue 2: The Scald & Crumble (HARD CONTRAST)]**
* **Action:** **SUBTRACTION.** Instantly `.stop` and `.clear` the `Ndef(\boilGranular)`. Fire a single, massive instance of `SynthDef(\scaldHiss)` via `.set`. Immediately initiate `Pbindef(\crumbleSeq)`.
* **Dynamics:** The hissing impact gives way to extreme dryness. The `Pbindef` plays chaotic, randomized 32nd-note clicks. Micro-pacing: Over the next 30 seconds, automate the `\decayTime` of the clicks from 0.1s down to 0.005s. The lumps are breaking down; the sound becomes smoother and tighter.

**0:55 — [Cue 3: The Knead]**
* **Action:** Initiate `Pbindef(\kneadBass)`. Introduce `Ndef(\milkSplash)`.
* **Dynamics:** A heavy, grooving 16th-note syncopated bassline anchors the mix. Randomize the `\foldAmount` on every beat so the "squish" feels organic and constantly shifting. The `Ndef(\milkSplash)` triggers bright, liquid FM bursts at random intervals (driven by `Dust.kr(0.8)`). 

**1:35 — [Cue 4: The Canastra Fold]**
* **Action:** Fade in `Ndef(\canastraChords)` over 8 seconds. 
* **Dynamics:** The harmonic space widens dramatically. The PM chords are thick and slightly pungent (using minor 2nd or tritone internal PM ratios that resolve to major thirds). `.xset` the wet mix of `Ndef(\heatReverb)` from 0.1 to 0.6 to create a massive sense of space.

**2:05 — [Cue 5: The Oven (LATE-STAGE CLIMAX)]**
* **Action:** **SUBTRACTION & INJECTION.** Hard stop `Pbindef(\kneadBass)` and `Pbindef(\crumbleSeq)`. Initiate `Pbindef(\ovenArp)`. 
* **Dynamics:** High kinetic energy. The `ovenArp` executes a frantic, ascending Lydian arpeggio across 4 octaves. Parameter randomization is mandated for the `\cutoff` and `\pan` of the plucks, creating a swirling, expanding stereo field. The piece does not slow down; it burns bright and fast, simulating the rising of the golden crust.

**2:40 — [Cue 6: The Golden Crust (RESOLUTION & FADE)]**
* **Action:** Explicitly conclude all active rhythms and begin the final fade. Command `Tdef.removeAll` and `Pbindef.removeAll` to stop the arpeggios. Command `Ndef.clear(20)` to initiate a 20-second fade-out for `Ndef(\canastraChords)`, `Ndef(\milkSplash)`, and `Ndef(\heatReverb)`.
* **Dynamics:** The frantic rhythm stops instantly, leaving only the massive, warm reverberation and harmonic pad to slowly decay into the void. 

**3:00 — [Cue 7: Silence]**
* **Action:** All fades complete. The server is left absolutely silent. Piece concludes.
```

---



## [2026-05-29 16:47:39] USE CASE: GENERATE_CODE | MODEL: gemini/gemini-3.1-pro-preview
**Cost & Token Usage:** In 16998 / Out 3076 | $0.10563 | 71.56s | Temp: 0.7
**Context Window:** 20074 / 2097152 (0.96%)

**Environmental Impact:**
- Energy: 0.293664 kWh
- GWP: 0.113380 kgCO2eq
- ADPE: 7.068640e-08 kgSbeq
- PE: 2.8546 MJ
- WCF: 1.295934 m3
*(Note: Measured)*

**System Guidance:**
```text
SuperCollider Fixed-Timeline Implementation Coder

You are an expert SuperCollider programmer, sound designer, and audio engineer. Your task is to take an approved Composition Plan and generate the complete, runnable SuperCollider code that perfectly executes it.

Implementation Rules:
1. Strict Adherence: You must strictly implement the structure, timelines, sound sources, and mixing rules defined in the provided Composition Plan. Adapt your synthesis techniques (e.g., FM, subtractive, granular, wave-folding, chaotic generators) to fit the specific aesthetic and genre requested by the plan. 
2. Safety First (CRITICAL): Every script MUST begin with a persistent Master Limiter to protect the user's hardware. You must define a \safetyLimiter SynthDef (using Limiter.ar(level: 0.85)) and map it to RootNode(s) via ServerTree so it survives Cmd + . execution.
3. Flexible Architecture, Node Safety & Sound Design: 
   - Choose the right tool for the job: Use Ndef proxies for continuous drones, textures, and heavy effects routing. Use standard SynthDef + Pbind / Pbindef for complex rhythmic, granular, or discrete event-based sequencing.
   - Node Deallocation (CRITICAL): All discrete SynthDefs triggered by Patterns MUST include `doneAction: 2` within their EnvGen.ar declarations to prevent runaway CPU accumulation and dead node pileups.
   - For all proxy and SynthDef definitions, include t_trig=1 to allow envelope re-triggering, and define exposed arguments (e.g., freqMult=1, ampMod=1) so parameters can be dynamically automated. 
4. Effects Architecture & Bus Management: When using JITLib, implement effects using proxy filter slots (e.g., Ndef(\name)[10] = \filter -> ...). 
   - Pbindef Bus Routing (CRITICAL): Explicitly route all Pattern outputs to your master JITLib mixer by including `\out, ~synthBus` inside every Pbind/Pbindef. Failure to do this will send discrete events straight to hardware out and bypass the FX chains entirely.
5. Timeline Scripting & Active Wait States:
   - The score MUST be executed inside a Tdef.
   - Active Wait States (CRITICAL): Do NOT use static, empty `.wait` periods longer than 8 seconds. If a macro-cue is 20 seconds long, break it up using iterative loops (e.g., `4.do { ... 5.wait; }`) to randomize proxy parameters, tweak SynthDef arguments, or trigger sub-gestures. The code must explicitly guarantee the sonic texture remains alive through micro-gestures.
6. Dynamics & Gestures:
   - For instantaneous changes or hard cuts defined in the plan, use .set() or .stop. Do not be afraid to execute brutal, instant stops if the plan demands it.
   - For fluid crossfades or sweeps in proxies, define .fadeTime and execute changes using .xset(). 
7. Cleanup: The Tdef must conclude by explicitly stopping all patterns (e.g., .stop or Pbindef.removeAll) and clearing all proxies (e.g., .clear). Execute this instantly without a fade if the plan requests a sudden halt.
8. Formatting: Ensure the entire code block is wrappable and executable as a single block by starting and ending the code with parenthesis ( ... ). Output ONLY the valid SuperCollider code block. Do NOT include markdown fences around the code if it's the final output.
9. GUI: Include s.makeGui; at the end of the script.
10. Scope & Execution: Beware of asynchronous execution. Put setup code, SynthDef loading, bus allocation, and effect routing inside an s.waitForBoot or separate parenthesis block from the actual performance Tdef, combined with s.sync, to guarantee smooth execution without "node not found" errors. 

*Note: The example below demonstrates the required FORMAT (Safety Limiter, Bus Routing, Active Waits, Hard Stops). Generate highly varied synthesis techniques, rhythms, and architectures based on what the specific Composition Plan demands.*

Example Structure:
(
s.waitForBoot({
    var masterScore;

    // --------------------------------------------------------------------
    // PRE-SETUP: BUS ROUTING
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
    SynthDef(\staccatoClick, { |out=0, freq=440, fmIndex=1, amp=0.1, pan=0|
        var env = EnvGen.ar(Env.perc(0.001, 0.05), doneAction: 2); // CRITICAL: doneAction 2
        var mod = SinOsc.ar(freq * 2.4) * fmIndex * freq * env;
        var sig = SinOsc.ar(freq + mod) * env;
        Out.ar(out, Pan2.ar(sig * amp, pan));
    }).add;

    SynthDef(\waveBass, { |out=0, freq=55, foldAmount=0.5, amp=0.5|
        var env = EnvGen.ar(Env.perc(0.01, 0.4), doneAction: 2);
        var sig = SinOsc.ar(freq);
        sig = Fold.ar(sig * (1 + (foldAmount * 10)), -0.5, 0.5) * env;
        sig = RLPF.ar(sig, freq * 4, 0.3);
        Out.ar(out, Pan2.ar(sig * amp, 0));
    }).add;

    s.sync;

    // --------------------------------------------------------------------
    // 2. NDEFS & EFFECTS ARCHITECTURE
    // --------------------------------------------------------------------
    Ndef(\viscousVoid, { |cutoff=400, modFreq=0.1, amp=0|
        var mod = LFSaw.ar(modFreq).range(0.5, 2);
        var sig = PMOsc.ar(50, 150, mod * 3);
        sig = MoogFF.ar(sig, cutoff, 2.5);
        Pan2.ar(sig * amp, 0);
    });

    Ndef(\chaoticSputter, { |dustDens=2, amp=0|
        var trigs = Dust.ar(dustDens);
        var freqs = TRand.ar(2000, 8000, trigs);
        var sig = Ringz.ar(trigs, freqs, 0.01);
        Pan2.ar(sig * amp, TRand.ar(-0.8, 0.8, trigs));
    });

    Ndef(\masterMix, {
        var synths = In.ar(~synthBus, 2); // Reading discrete Pattern synths
        var continuous = Ndef.ar(\viscousVoid, 2) + Ndef.ar(\chaoticSputter, 2);
        synths + continuous;
    });

    Ndef(\masterMix)[10] = \filter -> { |in|
        var wet = \wet10.kr(0);
        var verb = FreeVerb2.ar(in[0], in[1], mix: 1, room: 0.9, damp: 0.2);
        XFade2.ar(in, verb, wet * 2 - 1);
    };
    Ndef(\masterMix).set(\wet10, 0); 

    Ndef(\masterMix).play;
    s.sync;

    // --------------------------------------------------------------------
    // 3. THE SCRIPT (Tdef Score)
    // --------------------------------------------------------------------
    Tdef(\masterScore, {
        "0:00 - [Cue 1: Ignition]".postln;
        Pbindef(\clickSeq,
            \instrument, \staccatoClick,
            \out, ~synthBus, // CRITICAL: Routing to ~synthBus
            \dur, 0.125,
            \freq, Pseq([880, 1200, 440, 900], inf),
            \amp, 0.3
        ).play;

        // ACTIVE WAIT STATE: Breaking 28 seconds into loops to mutate parameters
        4.do {
            Pbindef(\clickSeq, \fmIndex, rrand(1.0, 8.0), \pan, rrand(-0.5, 0.5));
            7.wait; 
        };

        "0:28 - [Cue 2: The Void (HARD CONTRAST)]".postln;
        Pbindef(\clickSeq).stop; // INSTANT SUBTRACTION
        Ndef(\masterMix).set(\wet10, 0.8); // Instant Reverb ON
        Ndef(\viscousVoid).fadeTime = 0.1;
        Ndef(\viscousVoid).set(\amp, 0.8, \cutoff, 300);

        // ACTIVE WAIT STATE
        3.do {
            Ndef(\viscousVoid).xset(\modFreq, exprand(0.05, 1.5));
            5.wait;
        };
        2.wait;

        "0:45 - [Cue 3: Agitation Injections]".postln;
        Ndef(\chaoticSputter).fadeTime = 27;
        Ndef(\chaoticSputter).xset(\amp, 0.6, \dustDens, 150);
        Ndef(\viscousVoid).fadeTime = 27;
        Ndef(\viscousVoid).xset(\cutoff, 80);

        // ACTIVE WAIT STATE: Choking the drone while sputter rises
        9.do { |i|
            Ndef(\viscousVoid).xset(\modFreq, (i+1) * 0.5);
            3.wait;
        };

        "1:12 - [Cue 4: Late-Stage Overwhelm]".postln;
        Ndef(\masterMix).set(\wet10, 0); // Reverb INSTANTLY OFF for dry aggression
        
        Pbindef(\bassSeq,
            \instrument, \waveBass,
            \out, ~synthBus,
            \dur, Pseq([0.25, 0.25, 0.5], inf),
            \freq, Pseq([55, 60, 41.2], inf),
            \foldAmount, Pbrown(0.1, 1.0, 0.1, inf),
            \amp, 0.8
        ).play;

        Pbindef(\clickSeq, \dur, 0.0625, \fmIndex, 10, \freq, Pexprand(1000, 5000)).play;

        // ACTIVE WAIT STATE: Frantic 28 second climax
        7.do {
            Ndef(\chaoticSputter).xset(\dustDens, rrand(200, 500));
            4.wait;
        };

        "1:40 - [Cue 5: The Snap (TERMINATION)]".postln;
        // INSTANT CLEARANCE. NO FADES.
        Pbindef.removeAll;
        Ndef.clear;
        Tdef.removeAll;
        "Score Complete.".postln;
    });

    Tdef(\masterScore).play;
});

s.makeGui;
)

=== ADDITIONAL INSTRUCTION ===

### Entry [2026-03-16 19:03] (Auto Fix)
**LESSON:**

Do not apply `Collection` methods like `.flat` directly to SuperCollider `Pattern` objects (e.g., `Pn`, `Pseq`). Patterns generate a flattened stream of values by design; when patterns contain other patterns (like `Pwhite` inside `Pseq`), the outer pattern evaluates the inner ones and yields their values directly, not nested structures requiring `flat`.

### Entry [2026-03-16 19:05] (User Feedback)
LESSON: Be cautious with or avoid distortion effects, as the previous implementation was not well-received; prioritize clean sinewave generation.

### Entry [2026-03-20 12:06] (External Fix — Incremental Block 2)
LESSON: To avoid `DynKlank` `Message 'at' not understood` errors and incorrect argument warnings:
1.  **`specificationsArrayRef` Format:** The `specificationsArrayRef` argument *must* be a `Ref` to an array containing exactly three sub-arrays: `#[all_frequencies_array, all_amplitudes_array, all_ring_times_array]`. It does *not* accept an array of `[freq, amp, ring_time]` tuples.
2.  **Argument Naming:** `DynKlank` does not have `rq` or `decay` arguments. Use `decayscale` as a global multiplier for the ring times specified within the `specificationsArrayRef`. Individual resonance quality is controlled by the `ring_times` values themselves.

### Entry [2026-03-20 12:10] (User Feedback — Incremental Session)
LESSON: Improve `dynklang` generation quality to reduce the need for external correction, and enhance understanding of setup instructions to ensure the correct number of instruments are generated.

Pattern Streaming: Never apply array methods like .flat to Pattern objects (e.g., Pn, Pseq). Patterns inherently yield flattened streams; outer patterns evaluate inner patterns directly without needing structural flattening.

Timbre Preferences: Avoid distortion effects entirely. Prioritize clean, precise synthesis (e.g., pure sinewaves).

DynKlank Architecture: DynKlank requires strict array formatting and specific arguments:

Array Formatting: The parameter array must be wrapped in a Ref (`) and contain exactly three distinct sub-arrays: [[all_freqs], [all_amps], [all_ring_times]]. It will fail if passed an array of parameter tuples.

Arguments: Do not use rq or decay. Use decayscale as the global multiplier for the ring times defined in your array.

### Entry [2026-03-23 14:01] (User Feedback)
LESSON: Improve sound quality and aesthetics of generated SuperCollider code.

### Entry [2026-03-23 15:19] (System Correction)
LESSON: When implementing a Karplus-Strong plucked string model, do not use K2A.ar as the audio source. K2A converts a scalar value into a static DC audio offset; applying a percussive envelope to this simply produces an unpitched transient (a click).

Instead, use Pluck.ar, which accurately models string physics using three core components:

Excitation (in): Requires a short, enveloped burst of broad-spectrum noise (like WhiteNoise.ar) to act as the physical strike or pluck that initiates the feedback loop.

Pitch (delaytime): The pitch is determined by the length of the delay line. This must be set to 1/freq to establish the correct fundamental frequency.

Material Damping (coef): Controls the internal low-pass filter to simulate high-frequency energy loss. A value near 0 leaves the sound bright and metallic, while a value closer to 1 heavily dampens the highs. For intuitive live coding, map this as 1 - bright.

###Entry [2026-03-23 17:05] (System Improvement)
LESSON: When combining Pbindef sequences with Ndef.set live coding tweaks, do not hard-set a parameter (like \freq) via .set if it is already being sequenced by a pattern. Doing so immediately overrides and severs the pattern's control stream.

To globally shift or modify a running sequence without destroying the melodic line, explicitly separate your sequence data from your global offsets using one of three strategies:

Pattern Math: Apply mathematical operations directly within the Pbindef (e.g., \freq, Pn(...) * 1.5 or + 500) to keep all control within the pattern ecosystem.

Event Architecture: Sequence higher-level pitch keys like \midinote or \degree in your pattern. This frees up built-in global modifiers like \ctranspose to be safely manipulated via Ndef.set without breaking the sequence.

Dedicated Modifiers: Build custom offset or multiplier arguments into the actual instrument definition (e.g., adding a freqMult argument to the Ndef). Use the pattern exclusively for the base \freq, and reserve Ndef.set(\freqMult, ...) strictly for global live tweaks.

### Entry [2026-03-24 11:59] (User Feedback)
LESSON: Improve accuracy and reduce "little mistakes" in SuperCollider code generation.

### Entry [2026-03-25 11:58] (Auto Fix)
**LESSON:** In SuperCollider, use a standard array literal `[...]` when an array needs to contain values derived from dynamic calculations or variables (e.g., `freq*1.5`). The 'literal array' or 'quoted array' syntax `#[...]` is for arrays of static, non-evaluated literals and will cause a syntax error if expressions requiring computation are included.

### Entry [2026-03-25 11:58] (User Feedback)
LESSON: Ensure volume relations are normalized and the generated code includes a defined ending.

### Entry [2026-03-26 20:25] (Fix Tab)
**LESSON:** Always verify the existence of a specific Unit Generator (UGen) class (e.g., `Flanger.ar`) in SuperCollider's library before attempting to use it. A 'Class not defined' error indicates the UGen does not exist, and the desired effect may need to be implemented using combinations of available primitive UGens (e.g., `CombL.ar` with modulation for flanging).

### Entry [2026-03-28 12:58] (Fix Tab)
LESSON: When defining default values for arguments in SuperCollider function/closure headers (`|arg=default_value|`), always parenthesize negative numerical values. The parser can misinterpret a leading minus sign (`-`) as an unexpected binary operator, rather than part of the number literal, leading to a `syntax error, unexpected BINOP`.

**Correct:** `|minPan=(-0.8)|`
**Incorrect:** `|minPan=-0.8|`

### Entry [2026-03-28 12:58] (Fix Tab)
**Lesson:** When constructing arrays within a SuperCollider SynthDef (or Ndef function) whose elements are or depend on UGens, use a regular Array literal `[...]` instead of a Literal Array `#[...]`.

Literal Arrays (`#[...]`) are strictly for compile-time constants and cannot contain or perform operations with UGens. Using them with UGens (e.g., `#[1,2,3] * fund`) results in a `BinaryOpUGen` representing the *entire multiplication operation* rather than an array of multiplied UGens, causing subsequent methods like `.at` to fail because they expect an array, not an operation. Regular Arrays (`[...]`) allow for runtime evaluation during SynthDef graph building, correctly creating dynamic UGen arrays (e.g., `[1,2,3] * fund` becomes `[1*fund, 2*fund, 3*fund]`) which are often required by UGen constructors like `DynKlank`.

### Entry [2026-04-01 12:22] (Fix Tab - Offline)
The `filter` method for `Ndef` is an *instance method* that operates on a specific `NodeProxy`'s signal chain. It must be called on an *instance* of `Ndef` (e.g., `Ndef(\master)`), not the `Ndef` *class* itself (`Ndef`). Calling an instance method on a class results in a `Message '...' not understood` error.

**LESSON:** Always call instance-specific methods (like `filter` on an `Ndef`) on the *instance* of the object (`Ndef(\name)`), not on its *class* (`Ndef`).

### Entry [2026-04-01 12:23] (Fix Tab - Offline)
**LESSON:**

The `Ndef.filter(index, func)` method in SuperCollider's JITLib is used to **define a signal processing stage (a filter or effect) for a NodeProxy, expecting a *function* as its second argument (`func`)**. This function describes how the effect transforms an input signal (`|in|`).

The error `Message 'def' not understood` occurs when you attempt to *apply* an already existing UGen (like `sig`, which is an `OutputProxy` representing the `in` argument within the `Ndef`'s function) directly as the `func` argument to `Ndef.filter` *within* another `Ndef`'s definition.

JITLib expects `Ndef.filter` to be provided with a *definition* (a function that describes the filter), not an already processed signal UGen. When given a UGen, it attempts to access a `def` method (which UGens do not have in this context) to resolve its definition, resulting in the error.

**To avoid this:**
*   The primary `Ndef` function (`Ndef(\name, { |in| ... })`) should generate or process its core signal.
*   Separate effects should be **defined independently** using `Ndef(\name).filter(index, { |inputSig| ... filter code ... })`. JITLib automatically chains these defined filters to the main signal.

### Entry [2026-04-14 12:21] (Fix Tab - Offline)
**LESSON:** SuperCollider does not have a `Pexprange` class. To generate exponentially distributed random values within Patterns, use `Pexprand` (the exponential counterpart to `Pwhite`). Be careful not to confuse UGen range-mapping methods (like `.exprange`) with Pattern class names.

### Entry [2026-05-01 12:40] (Fix Tab - Offline)
**LESSON:**

When applying an array of parameters (e.g., `[0.5, 1.0, 2.0]`) to a multichannel signal (e.g., a stereo `In.ar`), passing both directly into a single UGen causes multichannel expansion to match the longest array, intertwining the channels and parameters. Calling `.sum` on this result flattens the entire structure into a single mono UGen. Attempting to index this mono UGen later (e.g., `sig[0]` and `sig[1]` for a panner) throws a `Message 'at' not understood` error because a single UGen is not an Array.

To apply multiple parallel parameters while preserving the original multichannel structure, iterate over the parameter array using `.collect`:

// WRONG: Flattens to mono, causing sig[0] to crash later
var formants = BPF.ar(sig, lpf * [0.5, 1.0, 2.0], fRq).sum; 

// RIGHT: Preserves the stereo array [ [L1, R1], [L2, R2], [L3, R3] ]
// .sum then adds Ls and Rs together correctly -> [ L_sum, R_sum ]
var formants = [0.5, 1.0, 2.0].collect({ |m| BPF.ar(sig, lpf * m, fRq) }).sum;

This ensures `.sum` performs element-wise addition across the multichannel arrays, keeping the stereo image intact and allowing array indexing later in the signal chain.

### Entry [2026-05-02 08:22] (Fix Tab - Offline)
**LESSON:**

When updating GUI widgets (like `EZSlider`, `EZKnob`, or `EZRanger`) from an external data structure via a polling loop, always verify that the retrieved value is not `nil` before assigning it to the widget. 

Passing `nil` to a widget's `.value_` setter causes its internal `ControlSpec` to attempt to constrain the value, which invokes `.asFloat` on `nil` and throws a `Message 'asFloat' not understood` runtime error. Wrapping the assignment in a `.notNil` check (e.g., `if(~data[key].notNil) { widget.value = ~data[key] }`) safely prevents this crash.

### Entry [2026-05-18 13:21] (Session Fix)

**LESSON:**
**Comb Filter Buffer Overruns:** When using `CombL` or `CombC` for physical modeling (Karplus-Strong), the delay time determines the pitch (`freq.reciprocal`). If you play a very low note, the resulting delay time can exceed the maximum allocated buffer size (the second argument of the UGen). When SuperCollider tries to read past the maximum buffer, it reads garbage memory (NaNs), instantly causing catastrophic distortion and locking the CPU at >100%.
*Fix:* Always ensure the max buffer size is large enough for sub-bass frequencies (e.g., `0.2` seconds), and explicitly `.clip` the dynamic delay time argument to stay slightly below that max buffer (e.g., `freq.reciprocal.clip(0.0001, 0.19)`).

### Entry [2026-05-18 13:21] (Session Fix)

**LESSON:**
**DC Offsets in Feedback Networks:** Adding microscopic DC offsets (e.g., `+ 1e-10`) to audio signals to prevent reverb denormalization is a common trick, but it is highly dangerous if fed into delay networks with high feedback (`CombC`, `DelayC`). The delay acts as an integrator, infinitely accumulating that invisible offset until the waveform is pushed entirely off-center. When this offset hits a non-linear stage (like a `tanh` wavefolder), it pins the audio to the digital ceiling, creating massive distortion.
*Fix:* Do not manually inject DC offsets into feedback loops. Instead, use `LeakDC.ar` immediately before distortion/clipping stages to ensure the waveform remains centered.

### Entry [2026-05-18 13:21] (Session Fix)

**LESSON:**
**Non-Existent Vanilla UGens (`Denormal.ar`):** SuperCollider does not have a native `Denormal.ar` UGen in its vanilla installation (it is part of the third-party `sc3-plugins` library). Attempting to call it will result in a `Class not defined` error.
*Fix:* Modern vanilla SuperCollider handles denormals automatically at the CPU level via "Flush-to-Zero" (FTZ) flags, rendering manual denormalization UGens largely obsolete for standard DSP graphs.

### Entry [2026-05-18 13:21] (Session Fix)

**LESSON:**
**Missing `.asMap` on Control Buses:** When mapping a `Bus.control` to a Synth argument upon instantiation, you must append `.asMap` (e.g., `\drive, ~buses.tapeDrive.asMap`). If you pass the bus object directly without `.asMap`, SuperCollider passes the **Bus ID number** (an integer, like 97 or 99) as a literal value. This causes catastrophic parameter blowouts (e.g., applying 99x distortion drive, or slamming a Low Pass Filter down to 97 Hz).

### Entry [2026-05-18 13:21] (Session Fix)

**LESSON:**
**Hardcoded GUI Window Bounds:** Hardcoding absolute coordinates and dimensions for UI Windows (e.g., `Rect(100, 100, 680, 860)`) is dangerous cross-platform. If the user's monitor vertical resolution is smaller than the hardcoded height, the window's title bar will render completely off-screen, making the window impossible to drag or close manually.
*Fix:* Always query the native monitor dimensions using `Window.availableBounds`. Dynamically cap the window height (`min(desiredHeight, screen.height - 50)`), center it geometrically (`bounds.center_(screen.center)`), and enable the `scroll: true` parameter on the `Window` so clipped UI elements can still be accessed.

### Entry [2026-05-29 13:20] (Fix Tab - Offline)
**LESSON:** 
In SuperCollider, all variable declarations (`var`) must be placed at the very top of a function or scope, strictly before any executable statements or assignments. Interleaving `var` declarations with executed code will result in a syntax error. Always group and declare your variables at the beginning of the block.

### Entry [2026-05-29 13:20] (Fix Tab - Offline)
**LESSON:**

When writing code inside an executing block or function (such as `s.waitForBoot({ ... })`), every statement must be separated by a semicolon `;`. 

Wrapping an individual definition (like an `Ndef` or `SynthDef`) in standalone parentheses `( ... )` is a common practice for evaluating code blocks in the IDE, but doing so *inside* an existing function requires the closing parenthesis to have a trailing semicolon `);`. 

If the semicolon is omitted, the SuperCollider parser fails to separate the expressions and throws an `unexpected CLASSNAME` syntax error when it reads the next line. 

**Best Practice:** Remove unnecessary standalone wrapping parentheses around individual definitions when they are already nested inside an outer execution block.
```

**Knowledge Base RAG Used:**
```text
--- RETRIEVED 1 (knowledge-base: ndef-famous-synths.scd) ---
var sig = SinOsc.ar([freq, freq * 1.01]);

    // The Buchla sound: Fold.ar bounces the wave back on itself when it exceeds bounds
    sig = Fold.ar(sig * foldDrive, -0.8, 0.8);

    // Add a little spring-like reverb
    sig = FreeVerb.ar(sig, 0.3, 0.9, 0.1);
    sig * 0.3;
}).play;
Ndef(\master) <<> Ndef(\buchlaDrone);
)

// BUCHLA 3: Timbres & Squelches (Modulated Fold)
(
Ndef(\buchlaSquish).fadeTime = 0.5;
Ndef(\buchlaSquish, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(110);
    var env = EnvGen.kr(Env.perc(0.01, 0.6), t_trig);
    var foldEnv = EnvGen.kr(Env.perc(0.1, 0.4), t_trig);

    var sig = LFTri.ar(freq);
    sig = Fold.ar(sig * (1 + (foldEnv * 4)), -0.5, 0.5);

    sig * env * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\buchlaSquish);

Ndef(\buchlaSquishSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\buchlaSquish).nodeID }), \args, #[\freq, \t_trig],
    \freq, Pseq([110, 220, 165, 330], inf), \dur, 0.5, \t_trig, 1
)).play;
)

// BUCHLA 4: Uncertainty Arp (Randomized FM amounts)
(
Ndef(\buchlaAlien).fadeTime = 1;
Ndef(\buchlaAlien, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(440);
    // Sample & Hold effect on FM index
    var fmIndex = TRand.kr(100, 2000, t_trig);
    var lpgEnv = EnvGen.kr(Env.perc(0.005, 0.1, 1, -4), t_trig);

    var mod = SinOsc.ar(freq * 0.5) * fmIndex;
    var sig = SinOsc.ar(freq + mod);

    sig = LPF.ar(sig, 500 + (lpgEnv * 6000)) * lpgEnv;
    sig * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\buchlaAlien);

Ndef(\buchlaAlienSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\buchlaAlien).nodeID }), \args, #[\freq, \t_trig],
    \freq, Pexprand(200, 1000, inf), \dur, 0.125, \t_trig, 1
)).play;
)


// =============================================================================
// 5. ROLAND JUPITER-8 (Thick Polyphony, Cross-Mod, 24dB Filter)
// =============================================================================

// JUPITER 1: Cross-Modulation Lead (Audio-rate FM between VCOs)
(
Ndef(\jpLead).fadeTime = 0.5;
Ndef(\jpLead, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(220);
    var xModDepth = \xmod.kr(300); // How hard Osc 2 pushes Osc 1

    var env = EnvGen.kr(Env.perc(0.05, 0.8), t_trig);

    var osc2 = Saw.ar(freq * 1.5); // Fixed interval for Osc 2
    var osc1 = Pulse.ar(freq + (osc2 * xModDepth), 0.5);

    var sig = Mix([osc1, osc2]) * 0.5;
    sig = MoogFF.ar(sig, 8000 * env, 0.5); // Jupiter had a great 24dB filter

    sig * env * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\jpLead);

Ndef(\jpLeadSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\jpLead).nodeID }), \args, #[\freq, \t_trig],
    \scale, Scale.dorian, \degree, Pseq([0, 2, 4, 7, 6, 4, 2, -1], inf),
    \dur, 0.25, \t_trig, 1
)).play;
)

// JUPITER 2: Lush String Pad (Detuned PWM)
(
Ndef(\jpPad).fadeTime = 3;
Ndef(\jpPad, {
    var freq = \freq.kr([110, 110]); // Array for chords
    var lfo = SinOsc.kr(0.4).range(0.1, 0.9);

    var osc1 = Pulse.ar(freq, width: lfo);
    var osc2 = Saw.ar(freq * 1.01);

    var sig = Splay.ar(osc1 + osc2);
    sig = MoogFF.ar(sig, 2500, 0.2);

    // Classic Roland 80s chorus simulation
    sig = sig + DelayC.ar(sig, 0.05, SinOsc.kr([0.5, 0.6]).range(0.01, 0.02));

    sig * 0.3;
}).play;
Ndef(\master) <<> Ndef(\jpPad);

Ndef(\jpPadSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\jpPad).nodeID }), \args, #[\freq],
    \midinote, Pseq([ [[55, 59, 62]], [[53, 57, 60]] ], inf), \dur, 4
)).play;
)

// JUPITER 3: Sync Arp (Hard Sync with Envelope sweeping the Slave)
(
Ndef(\jpSync).fadeTime = 0.5;
Ndef(\jpSync, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(110);
    var env = EnvGen.kr(Env.perc(0.01, 0.5), t_trig);
    var sweepEnv = EnvGen.kr(Env.perc(0.01, 0.3), t_trig);

    var sig = SyncSaw.ar(freq, freq * (1 + (sweepEnv * 4)));
    sig = MoogFF.ar(sig, 6000, 0.5);

    sig * env * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\jpSync);

--- RETRIEVED 2 (knowledge-base: ndef-famous-synths.scd) ---
// =============================================================================
// 1. THE OBERHEIM 12dB FAMILY (Lush, Brassy, Wide)
// =============================================================================

// OBERHEIM 1: Plucky Arp
(
Ndef(\obArp).fadeTime = 0.5;
Ndef(\obArp, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(220);
    var sig = Pulse.ar([freq, freq * 1.01], SinOsc.kr(1).range(0.1, 0.5));
    var env = EnvGen.kr(Env.perc(0.01, 0.2), t_trig);
    var fEnv = EnvGen.kr(Env.perc(0.01, 0.4), t_trig);
    sig = RLPF.ar(sig, 200 + (fEnv * 3000), \rq.kr(0.3));
    sig * env * 0.4;
}).play;
Ndef(\master) <<> Ndef(\obArp);

Ndef(\obArpSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\obArp).nodeID }), \args, #[\freq, \t_trig],
    \scale, Scale.minor, \degree, Pseq([0, 2, 4, 7, 12, 7, 4, 2], inf),
    \dur, 0.125, \octave, [4, 5], \t_trig, 1
)).play;
)

// OBERHEIM 2: Shimmering Drone
(
Ndef(\obDrone).fadeTime = 3;
Ndef(\obDrone, {
    var freq = \freq.kr(55);
    var pwm = SinOsc.kr([0.1, 0.12]).range(0.1, 0.9);
    var sig = Pulse.ar([freq, freq*1.5, freq*2.01], width: pwm).sum;
    var lfo = SinOsc.kr(0.05).exprange(300, 2000);
    sig = RLPF.ar(sig, lfo, 0.1);
    sig = sig + DelayC.ar(sig, 0.2, SinOsc.kr(0.2).range(0.01, 0.03));
    sig * 0.1 ! 2;
}).play;
Ndef(\master) <<> Ndef(\obDrone);
)

// OBERHEIM 3: Classic Brass Stabs
(
Ndef(\obBrass).fadeTime = 0.1;
Ndef(\obBrass, {
    var t_trig = \t_trig.tr(1);

    // 1. Array Control
    var freq = \freq.kr([110, 110, 110]);

    // Splay perfectly mixes our massive 12-oscillator stack (3 notes * 4 detuned saws)
    var sig = Splay.ar(Saw.ar(freq * [0.99, 1, 1.015, 1.02]));

    // 2. Perc Envelopes: These play out fully when hit by a t_trig.
    // I kept your original attack times to preserve that sluggish, brassy swell.
    var env = EnvGen.kr(Env.perc(attackTime: 0.1, releaseTime: 1.5), t_trig);
    var fEnv = EnvGen.kr(Env.perc(attackTime: 0.15, releaseTime: 1.0), t_trig);

    sig = RLPF.ar(sig, 400 + (fEnv * 4000), 0.5);
    sig * env * 0.3;
}).play;
Ndef(\master) <<> Ndef(\obBrass);

Ndef(\obBrassSeq, Pbind(
    \type, \set,
    \id, Pfunc({ Ndef(\obBrass).nodeID }),
    \args, #[\freq, \t_trig],
    // 3. Double-bracketed arrays: [[Note, Note, Note]]
    // This stops Pbind from splitting the chord and forces it to send the array to our Ndef.
    \midinote, Pseq([ [[48, 55, 60]], [[46, 53, 58]] ], inf),
    \dur, Pseq([1.5, 2.5], inf),
    \t_trig, 1
)).play;
)

// OBERHEIM 4: Fat Sub Bass
(
Ndef(\obBass, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(41.2);
    var sig = LFTri.ar(freq) + SinOsc.ar(freq * 0.5);
    var env = EnvGen.kr(Env.perc(0.01, 0.5), t_trig);
    sig = RLPF.ar(sig, 800, 0.8);
    (sig * env * 0.8 ! 2).tanh;
}).play;
Ndef(\master) <<> Ndef(\obBass);
Ndef(\obBass).xset(\t_trig, 1);
)

// OBERHEIM 5: Cinematic Noise Sweeps
(
Ndef(\obWind).fadeTime = 2;
Ndef(\obWind, {
    var sweep = LFSaw.kr(0.05).exprange(100, 8000);
    var sig = PinkNoise.ar(1);
    sig = RLPF.ar(sig, sweep, 0.05);
    sig * 0.2 ! 2;
}).play;
Ndef(\master) <<> Ndef(\obWind);
)

// =============================================================================
// 2. THE MOOG 24dB FAMILY (Fat, Driven, Punchy)
// =============================================================================

// MOOG 1: Berlin School Sequence
(
Ndef(\moogBerlin).fadeTime = 0;
Ndef(\moogBerlin, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(110);
    var sig = Saw.ar([freq, freq * 1.01]);
    var fEnv = EnvGen.kr(Env.perc(0.01, 0.2, 1, -4), t_trig);
    var env = EnvGen.kr(Env.perc(0.01, 0.3), t_trig);

    sig = MoogFF.ar(sig, 100 + (fEnv * 3000), 1.5);
    sig = sig * env;
    sig = sig + CombC.ar(sig, 0.5, [0.375, 0.5], 3, 0.5);
    (sig * 0.5).tanh;
}).play;
Ndef(\master) <<> Ndef(\moogBerlin);

--- RETRIEVED 3 (knowledge-base: ndef-famous-synths.scd) ---
var sig = SyncSaw.ar(freq, freq * (1 + (sweepEnv * 4)));
    sig = MoogFF.ar(sig, 6000, 0.5);

    sig * env * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\jpSync);

Ndef(\jpSyncSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\jpSync).nodeID }), \args, #[\freq, \t_trig],
    \octave, Pseq([3, 4, 5, 4], inf), \degree, Pseq([0, 0, 0, 0], inf),
    \dur, 0.125, \t_trig, 1
)).play;
)

// JUPITER 4: Brassy Poly Chords
(
Ndef(\jpBrass).fadeTime = 0.5;
Ndef(\jpBrass, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr([220, 220, 220]);
    var env = EnvGen.kr(Env.perc(0.08, 1.2), t_trig);
    var fEnv = EnvGen.kr(Env.perc(0.12, 0.8), t_trig);

    var sig = Splay.ar(Saw.ar(freq * [0.995, 1, 1.005]));
    sig = MoogFF.ar(sig, 300 + (fEnv * 3000), 1.2);

    sig * env * 0.4;
}).play;
Ndef(\master) <<> Ndef(\jpBrass);
)


// =============================================================================
// 6. ROLAND JUNO (DCOs, Sub-Oscillator, and the Magic Chorus)
// =============================================================================

// JUNO 1: Classic Hover/Chord (Saw + Square + Sub + Chorus)
(
Ndef(\junoChord).fadeTime = 0.5;
Ndef(\junoChord, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr([220, 220, 220]);
    var env = EnvGen.kr(Env.perc(0.01, 1.5), t_trig);

    var saw = Saw.ar(freq);
    var pulse = Pulse.ar(freq, SinOsc.kr(0.3).range(0.2, 0.8));
    var sub = Pulse.ar(freq * 0.5, 0.5); // The classic Juno Sub

    var sig = Splay.ar(saw + pulse + sub) * 0.33;

    // Juno Chorus I Simulation (Rich, wide, slow)
    var chorus = DelayC.ar(sig, 0.05, SinOsc.kr([0.5, 0.55], [0, pi]).range(0.005, 0.015));

    // Juno filter setup: Static HPF into Enveloped LPF
    sig = HPF.ar(sig, 150);
    sig = MoogFF.ar(sig, 800 + (env * 4000), 0.5);

    sig = sig + chorus;

    sig * env * 0.4;
}).play;
Ndef(\master) <<> Ndef(\junoChord);

Ndef(\junoChordSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\junoChord).nodeID }), \args, #[\freq, \t_trig],
    \midinote, Pseq([ [[60, 64, 67]], [[55, 59, 62]], [[57, 60, 64]] ], inf),
    \dur, 2, \t_trig, 1
)).play;
)

// JUNO 2: Snappy Bass (Resonant, punchy envelope)
(
Ndef(\junoBass).fadeTime = 0.5;
Ndef(\junoBass, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(55);
    var env = EnvGen.kr(Env.perc(0.001, 0.4), t_trig);

    var sig = Saw.ar(freq) + Pulse.ar(freq * 0.5, 0.5); // Saw + Sub
    sig = MoogFF.ar(sig, 100 + (env * 2500), 2.5); // High resonance

    (sig * 1.5).tanh * env * 0.5 ! 2;
}).play;
Ndef(\master) <<> Ndef(\junoBass);

Ndef(\junoBassSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\junoBass).nodeID }), \args, #[\freq, \t_trig],
    \degree, Pseq([0, 0, 7, 0, 0, -2, 0, 3], inf), \octave, 3, \dur, 0.25, \t_trig, 1
)).play;
)

// JUNO 3: Shimmering Arp (PWM heavy)
(
Ndef(\junoArp).fadeTime = 0.5;
Ndef(\junoArp, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(440);
    var env = EnvGen.kr(Env.perc(0.01, 0.3), t_trig);

    var sig = Pulse.ar(freq, SinOsc.kr(1.5).range(0.1, 0.9));
    sig = MoogFF.ar(sig, 1000 + (env * 2000), 1.0);

    // Juno Chorus II Simulation (Faster, deeper)
    sig = sig + DelayC.ar(sig, 0.05, SinOsc.kr([0.8, 0.85], [0, pi]).range(0.01, 0.025));

    sig * env * 0.3;
}).play;
Ndef(\master) <<> Ndef(\junoArp);

Ndef(\junoArpSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\junoArp).nodeID }), \args, #[\freq, \t_trig],
    \scale, Scale.minor, \degree, Pseq([0, 2, 4, 7, 9, 7, 4, 2], inf),
    \dur, 0.125, \t_trig, 1
)).play;
)

// JUNO 4: Ghostly Pad (High pass filter focused)
(
Ndef(\junoPad).fadeTime = 3;
Ndef(\junoPad, {
    var freq = \freq.kr(110);
    var sig = Saw.ar([freq, freq*1.01]) + Pulse.ar([freq*2, freq*2.01], 0.5);

    // HPF cranked up to thin out the sound
    sig = HPF.ar(sig, 1000);
    sig = MoogFF.ar(sig, SinOsc.kr(0.1).exprange(1200, 4000), 0.5);

    sig = sig + DelayC.ar(sig, 0.05, SinOsc.kr([0.4, 0.45]).range(0.01, 0.02));
    sig * 0.2;
}).play;
Ndef(\master) <<> Ndef(\junoPad);
)

--- RETRIEVED 4 (knowledge-base: user-kb.scd) ---
// --- User Knowledge Entry [2026-03-26 20:29] ---
// test block file
(
Pbindef(\padSeq,
    \instrument, \pad,
    \degree, Pseq([0, 2, 4, 7, 5, 2, 0, 7], inf), // Simple harmonic changes
    \scale, Scale.minor,
    \dur, 1, // Faster note duration
    \legato, 0.7, // Shorter legato for more distinct notes
    \amp, 0.4,
    \atk, 0.5, // Shorter attack for faster notes
    \rel, 1.0, // Shorter release for faster notes
    \t_trig, 1
);
Ndef(\pad).quant = 1;
Ndef(\pad)[1] = \set -> Pbindef(\padSeq);
)


// --- User Knowledge Entry [2026-04-01 12:00] ---
// Instruments setup to emulate the Parker Solar Probe's mission.
(
Ndef(\voidPad).clear;
Ndef(\voidPad, {
	|freq=40, amp=0.3, t_trig=1, hpfFreq=20|
	var env, sig, sub;
	env = EnvGen.ar(Env([0, 1, 0.8, 0], [2, 3, 3]), t_trig);
	sig = Saw.ar([freq, freq * 1.01]);
	sub = SinOsc.ar([freq * 0.5, freq * 0.505]);
	sig = RLPF.ar(sig + sub, freq * 3, 0.4);
	sig = HPF.ar(sig, hpfFreq);
	sig * env * amp;
}).play;

Ndef(\probePulse).clear;
Ndef(\probePulse, {
	|freq=2000, modFreq=500, modIndex=1, amp=0.35, t_trig=1|
	var env, mod, sig;
	env = EnvGen.ar(Env.perc(0.005, 0.1), t_trig);
	mod = SinOsc.ar(modFreq) * modIndex * freq;
	sig = SinOsc.ar(freq + mod);
	Pan2.ar(sig * env * amp, 0);
}).play;

Ndef(\venusGravity).clear;
Ndef(\venusGravity, {
	|freq=80, sweepDur=4, amp=0.5, t_trig=1, pan=0|
	var env, sweep, sig;
	env = EnvGen.ar(Env.perc(0.1, sweepDur), t_trig);
	sweep = EnvGen.ar(Env([freq * 6, freq, freq * 0.2], [0.1, sweepDur * 0.9], \exp), t_trig);
	sig = Pulse.ar(sweep, 0.3) + Saw.ar(sweep * 1.01);
	sig = RLPF.ar(sig, sweep * 1.5, 0.2);
	Pan2.ar(sig * env * amp, pan);
}).play;

Ndef(\solarWind).clear;
Ndef(\solarWind, {
	|amp=0.25, t_trig=1, bpfFreq=2000, rq=0.1|
	var env, sig;
	env = EnvGen.ar(Env.perc(0.01, 0.2), t_trig);
	sig = Array.fill(4, { PinkNoise.ar() + (WhiteNoise.ar() * 0.5) });
	sig = BPF.ar(sig, bpfFreq, rq);
	Splay.ar(sig) * env * amp;
}).play;
)

--- RETRIEVED 5 (knowledge-base: ndef-famous-synths.scd) ---
// =============================================================================
// 8. FARFISA COMPACT (Transistor Organ, Divide-down, Bright/Buzzy)
// Concept: Organs don't usually have filter sweeps. Tone is created by summing
// multiple pulse/square waves across octaves, combined with vibrato.
// =============================================================================

// FARFISA 1: Psychedelic Rock Organ (60s style)
(
Ndef(\farfisaRock).fadeTime = 0.5;
Ndef(\farfisaRock, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr([220, 220, 220]); // Chords
    var env = EnvGen.kr(Env.perc(0.01, 1.0), t_trig);

    var vibrato = SinOsc.kr(7) * 3; // Fast, deep vibrato
    var baseFreq = freq + vibrato;

    // Organs sum octaves (16', 8', 4', 2')
    var osc16 = Pulse.ar(baseFreq * 0.5, 0.5) * 0.4;
    var osc8 = Pulse.ar(baseFreq, 0.1) * 0.8; // Narrow pulse = bright Farfisa tone
    var osc4 = Pulse.ar(baseFreq * 2, 0.5) * 0.3;

    var sig = Splay.ar(osc16 + osc8 + osc4);

    // Static EQ to emphasize the "buzz"
    sig = BPF.ar(sig, 2000, 1.5) + (sig * 0.5);

    sig * env * 0.3;
}).play;
Ndef(\master) <<> Ndef(\farfisaRock);

Ndef(\farfisaRockSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\farfisaRock).nodeID }), \args, #[\freq, \t_trig],
    \midinote, Pseq([ [[60, 64, 67]], [[60, 65, 69]] ], inf), \dur, 1, \t_trig, 1
)).play;
)

// FARFISA 2: Staccato Skank (Ska/Reggae organ chops)
(
Ndef(\farfisaChop).fadeTime = 0.5;
Ndef(\farfisaChop, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(440);
    // Extremely tight percussive envelope for organ stabs
    var env = EnvGen.kr(Env.perc(0.001, 0.15), t_trig);

    var sig = Pulse.ar(freq, 0.2) + Pulse.ar(freq * 2, 0.5);
    sig = LPF.ar(sig, 6000); // Tame the highest fizz

    sig * env * 0.4 ! 2;
}).play;
Ndef(\master) <<> Ndef(\farfisaChop);

Ndef(\farfisaChopSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\farfisaChop).nodeID }), \args, #[\freq, \t_trig],
    // Off-beat sequencing
    \dur, Pseq([0.25, Rest(0.25)], inf), \degree, 4, \t_trig, 1
)).play;
)

// FARFISA 3: The "Cheese" Drone (Multi-octave, heavily modulated)
(
Ndef(\farfisaDrone).fadeTime = 2;
Ndef(\farfisaDrone, {
    var freq = \freq.kr(110);
    var vibrato = SinOsc.kr(6.5) * 4;

    var sig = Mix.fill(4, { |i|
        // Creates 4 octaves (1, 2, 4, 8 multipliers)
        Pulse.ar((freq + vibrato) * (2 ** i), 0.1) * (0.5 ** i)
    });

    sig = sig + DelayC.ar(sig, 0.1, 0.05); // Spring reverb-ish slapback
    sig * 0.15 ! 2;
}).play;
Ndef(\master) <<> Ndef(\farfisaDrone);
)

// FARFISA 4: Dark Carnival (Detuned, beating organ)
(
Ndef(\farfisaCarnival).fadeTime = 0.5;
Ndef(\farfisaCarnival, {
    var t_trig = \t_trig.tr(1);
    var freq = \freq.kr(220);
    var env = EnvGen.kr(Env.perc(0.05, 0.5), t_trig);

    // Deliberately out of tune oscillators for that broken carousel vibe
    var sig = Pulse.ar(freq, 0.5) + Pulse.ar(freq * 1.02, 0.5);

    sig * env * 0.3 ! 2;
}).play;
Ndef(\master) <<> Ndef(\farfisaCarnival);

Ndef(\farfisaCarnivalSeq, Pbind(
    \type, \set, \id, Pfunc({ Ndef(\farfisaCarnival).nodeID }), \args, #[\freq, \t_trig],
    \scale, Scale.harmonicMinor, \degree, Pseq([0, 2, 1, -1], inf),
    \dur, 0.5, \t_trig, 1
)).play;
)
```

**User Prompt & Subtext:**
```text
Context: Working in 'sc-files/test.scd'. Previous code:


=== APPROVED COMPOSITION PLAN ===
# Composition Plan: Pão de Queijo (The Alchemy of Dough)

## 1. Macro-Structure, Valence, & Arc
* **Movement I [0:00 - 0:25]: The Boil (Anticipation & Heat).** Fluid, warm, and rising in tension. Translates the boiling of milk and oil through bubbling granular textures and low-frequency swells. The valence is anticipatory and kinetic.
* **Movement II [0:25 - 0:55]: The Scald & Crumble (Subtractive Contrast & Texture).** A sudden, hissing shock as boiling liquid hits dry starch, followed by a frantic, dry, pointillistic section. Low frequencies are entirely subtracted. The valence is chaotic, tactile, and ASMR-like, representing the breaking up of lumps.
* **Movement III [0:55 - 1:35]: The Knead (Viscous Rhythm).** The dough comes together. A heavy, squelchy, wave-folded rhythmic bass enters, joined by sporadic, bright liquid splashes (adding milk). The valence shifts to a physical, grooving, and highly kinetic state.
* **Movement IV [1:35 - 2:05]: The Canastra Fold (Pungent Harmonics).** The addition of cured cheese introduces sharp, rich, and slightly dissonant harmonic arrays. The texture becomes dense and expansive, utilizing complex Phase Modulation to represent the sharp flavor profile.
* **Movement V [2:05 - 2:40]: The Oven (Late-Stage Kinetic Expansion).** High thermal energy and expansion. Instead of a static drone, the climax is euphoric, hot, and densely active. Frantic 16th-note arpeggios in a bright Lydian mode swirl and expand in register, simulating the dough rising and turning golden in the heat. 
* **Movement VI [2:40 - 3:00]: The Golden Crust (Resolution & Fade).** The heat dissipates. A long, controlled fade into absolute silence. 

## 2. Sound Sources & Architecture
* `Ndef(\boilGranular)`: A granular synthesizer driven by `LFNoise1` modulating `GrainFM`. Used for the bubbling, fluid textures of heating oil and milk.
* `SynthDef(\scaldHiss)`: A sharp, burst-envelope synth utilizing filtered `WhiteNoise` with a high resonance peak to simulate the sizzle of scalding starch.
* `SynthDef(\crumbleClick)` + `Pbindef(\crumbleSeq)`: Extremely short, dry physical modeling impulses (using `Klank` or `Ringz` with tiny decay times) to represent the breaking of starch lumps. 
* `SynthDef(\squelchBass)` + `Pbindef(\kneadBass)`: A wave-folded subtractive bass synth. The envelope is tightly mapped to a low-pass filter cutoff, creating a squishy, viscous "kneading" sound.
* `Ndef(\milkSplash)`: High-pitched, frequency-modulated sine bursts triggered via `Dust.kr`, simulating the gradual addition of milk.
* `Ndef(\canastraChords)`: A dense, JITLib-based PM (Phase Modulation) synth pad. Rich, slightly detuned, and harmonically complex.
* `SynthDef(\ovenPluck)` + `Pbindef(\ovenArp)`: Bright, snappy wavetable plucks for the frantic, expanding climax.

## 3. Modifiers & Effects Architecture
* **Modifiers:** 
  * `\grainDens` and `\fmIndex` in `Ndef(\boilGranular)` to automate the heat.
  * `\decayTime` in `Pbindef(\crumbleSeq)` (shortening over time to simulate lumps dissolving).
  * `\foldAmount` in the `squelchBass` to increase the "stickiness" of the dough.
* **Effects:** 
  * `Ndef(\heatReverb)`: A large, warm reverberation space on a dedicated bus. 
  * `Ndef(\masterGlue)`: A master bus compressor (using `Compander`) to keep the squelch bass and chaotic crumbles tightly balanced before hitting the Master Limiter (0.85).

## 4. Mixing & Arrangement Strategy
* **Group Management:** `~sourceGroup` will contain all discrete Synths and Pbinds, feeding into `~fxGroup` (Reverb and Compressor).
* **Subtractive Dynamicity:** The transition at 0:25 relies on instantly killing the low-end rumble of the boil to create a stark, dry, high-frequency space for the crumble. At 2:05, the heavy `squelchBass` is muted to clear the low-mid spectrum, allowing the frantic `ovenArp` to dominate the spotlight without muddying the mix.

## 5. Absolute Timeline & Cue Sheet

**0:00 — [Cue 1: The Boil]**
* **Action:** Fade in `Ndef(\boilGranular)` over 3 seconds. 
* **Dynamics:** Start with low `\grainDens` (e.g., 5 Hz). Over the next 25 seconds, use a routine to `.xset` the density up to 120 Hz and slowly sweep the `\fmIndex` upward. The texture should feel like a rolling boil.

**0:25 — [Cue 2: The Scald & Crumble (HARD CONTRAST)]**
* **Action:** **SUBTRACTION.** Instantly `.stop` and `.clear` the `Ndef(\boilGranular)`. Fire a single, massive instance of `SynthDef(\scaldHiss)` via `.set`. Immediately initiate `Pbindef(\crumbleSeq)`.
* **Dynamics:** The hissing impact gives way to extreme dryness. The `Pbindef` plays chaotic, randomized 32nd-note clicks. Micro-pacing: Over the next 30 seconds, automate the `\decayTime` of the clicks from 0.1s down to 0.005s. The lumps are breaking down; the sound becomes smoother and tighter.

**0:55 — [Cue 3: The Knead]**
* **Action:** Initiate `Pbindef(\kneadBass)`. Introduce `Ndef(\milkSplash)`.
* **Dynamics:** A heavy, grooving 16th-note syncopated bassline anchors the mix. Randomize the `\foldAmount` on every beat so the "squish" feels organic and constantly shifting. The `Ndef(\milkSplash)` triggers bright, liquid FM bursts at random intervals (driven by `Dust.kr(0.8)`). 

**1:35 — [Cue 4: The Canastra Fold]**
* **Action:** Fade in `Ndef(\canastraChords)` over 8 seconds. 
* **Dynamics:** The harmonic space widens dramatically. The PM chords are thick and slightly pungent (using minor 2nd or tritone internal PM ratios that resolve to major thirds). `.xset` the wet mix of `Ndef(\heatReverb)` from 0.1 to 0.6 to create a massive sense of space.

**2:05 — [Cue 5: The Oven (LATE-STAGE CLIMAX)]**
* **Action:** **SUBTRACTION & INJECTION.** Hard stop `Pbindef(\kneadBass)` and `Pbindef(\crumbleSeq)`. Initiate `Pbindef(\ovenArp)`. 
* **Dynamics:** High kinetic energy. The `ovenArp` executes a frantic, ascending Lydian arpeggio across 4 octaves. Parameter randomization is mandated for the `\cutoff` and `\pan` of the plucks, creating a swirling, expanding stereo field. The piece does not slow down; it burns bright and fast, simulating the rising of the golden crust.

**2:40 — [Cue 6: The Golden Crust (RESOLUTION & FADE)]**
* **Action:** Explicitly conclude all active rhythms and begin the final fade. Command `Tdef.removeAll` and `Pbindef.removeAll` to stop the arpeggios. Command `Ndef.clear(20)` to initiate a 20-second fade-out for `Ndef(\canastraChords)`, `Ndef(\milkSplash)`, and `Ndef(\heatReverb)`.
* **Dynamics:** The frantic rhythm stops instantly, leaving only the massive, warm reverberation and harmonic pad to slowly decay into the void. 

**3:00 — [Cue 7: Silence]**
* **Action:** All fades complete. The server is left absolutely silent. Piece concludes.

Request: Receita de Pão de Queijo da Dona Eliza
1kg de polvilho doce
1 prato fundo até no friso de óleo
1 prato fundo até no friso de leite
8 ovos
1 colher de sopa não muito cheia de sal
1 prato cheio até o friso de queijo canastra ralado (mais curado)
Modo de fazer
Colocar pra ferver o leite junto com o óleo.
Depois de fervido, escaldar o polvilho já com o sal. Assim que esfriar misturar bem com as mãos o polvilho para desencaroçar todo.
Depois que desencaroçar, colocar os ovos e amassar bastante até que a massa fique bem lisa. Pode ir colocando leite aos poucos para ficar bem lisinha.
Depois de bastante lisa, colocar o queijo e mexer bastante. Até ficar homogênea e lisa. A massa fica mais mole. (O leite vai colocando aos poucos).
Enrolar os pães de queijo com as mãos untadas com óleo, pois a massa gruda nas mãos se não colocar o óleo.
Colocar para assar em forno pré-aquecido a 180 graus por aproximadamente uns 30 a 40 minutos.
Output ONLY the valid SuperCollider code block executing the plan. 
The Tdef script MUST conclude by stopping all Pbindefs, clearing all Ndefs with a long fade, and leaving the server silent. Include s.makeGui; at the end.
```

**Final Answer/Output:**
```supercollider
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
```

---
