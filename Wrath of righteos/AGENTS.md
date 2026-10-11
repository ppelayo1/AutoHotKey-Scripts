# Project Instructions

## General

- This workspace supports a Pathfinder: Wrath of the Righteous playthrough.
- Keep explanations practical, concise, and spoiler-light unless spoilers are requested.
- Preserve user-created files and unrelated changes.

## AutoHotkey

- Use AutoHotkey v1 syntax for `.ahk` scripts.
- Keep game macros scoped to `Wrath.exe`.
- Use screen coordinates for `MouseClick` automation.
- Do not add extra casts, clicks, or delays beyond the requested sequence.

### Animal Companions

- Each character's animal-companion display button shares that character portrait's X coordinate and uses Y coordinate `1185`.
- Clicking a character's animal-companion display button inserts that companion into the party UI immediately to the right of its owner.
- When a companion is displayed, every following character shifts one portrait slot to the right. For example, displaying character 2's companion makes the companion character 3 in the UI and shifts the original character 3 to character 4.
- After casting on an animal companion, close its companion UI by clicking that owner's animal-companion display button again, unless the requested sequence explicitly needs the companion to remain displayed.
- Account for this temporary party-slot shift before adding or changing any portrait-click automation.

## Character Assets

- Keep Zoltar's character notes in `Zoltar.md`.
- Store Zoltar portrait files under `portraits/Zoltar/`.
- Preserve the required portrait filenames: `Fulllength.png`, `Medium.png`, and `Small.png`.
- Do not replace portraits or generated artwork unless explicitly asked.

## Notes to Add

### Casting Order

- Before casting with a character, left-click that character's portrait to select them.
- Personal spells never need a target click: select the caster, then click the spell.
- All non-personal spells need a target click: select the caster, click the spell, then click the target's portrait.
- When switching casters, always select the next caster's portrait before clicking their spell.
- Wait between consecutive spells cast by the same character, but do not wait after a caster's final spell; immediately select the next caster.

Example: character 1 may cast two spells, then the script selects character 2's portrait before casting character 2's spells.
