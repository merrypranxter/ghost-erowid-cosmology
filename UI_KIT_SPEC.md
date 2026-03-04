# UI Kit Spec — Psychedelic OS (Ghost x Erowid)

This defines reusable UI components for posters, zines, animations, and prompt packs.

## UI COMPONENTS (CORE)
1) **Dialog Boxes**
- Title bar (ALL CAPS)
- Body copy (short, punchy)
- Two buttons: `[ACKNOWLEDGE]` and `[IGNORE]` (or `[EJECT]`)

2) **System Notifications**
- Small icon + one-line headline + microtext
- Example headlines: “CARRIER WAVE LOCKED”, “UNAUTHORIZED INTRUDER”, “CACHE OVERFLOW”

3) **HUD Overlays**
- Reticle / focus ring (for MSG_LOOK, THR_CARRIER_WAVE)
- Frequency readout bar
- Grid coordinate stamps (for GEO_HONEYCOMB)

4) **Boot Screens**
- BIOS/Power Layer (LOC_BIOS_LAYER): whiteout, minimal UI
- Desktop Environment (LOC_DESKTOP_ENV): windows, icons, menus

5) **Syslog / Audit Trails**
- Monospace log lines: timestamp + module + status
- Use this when you want the image to feel like evidence

## STYLE RULES (GLOBAL)
- Geometry overlays are always present (even faint): fractal, hex, vortex, seam.
- Text is part of the art: captions, warnings, labels, microtext.
- Emotions control color grading:
  - EMO_NOSTALGIA = VHS/polaroid haze
  - EMO_TERROR_EDGE = strobe, tearing noise
  - EMO_BENEVOLENCE = halo bloom, warm softness

## DEFAULT COPY BANK (STEAL THIS)
- “EVENT: POP — MODE SWITCH”
- “CARRIER WAVE: RISING”
- “ACCESS SEAM DETECTED”
- “CACHE OVERFLOW — LOOP DETECTED”
- “OBJECT NOT FOUND — PHANTOM LOOP”
- “TERMINAL MODE: CONNECTED”
- “LOGIN CREDENTIAL: ACCEPTED / DENIED”
- “DO NOT BE AFRAID”
- “JUST LOOK”
- “MORE REAL THAN REAL”

## ICON FAMILY IDEAS (OPTIONAL)
- Not required now, but keep in mind:
  - Entity icons = silhouette glyphs
  - Geometry icons = simple line shapes
  - Threshold icons = event symbols (spark, seam, wave)
