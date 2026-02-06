# Design Document: Take Your Time

## Vision Statement

**Take Your Time** is an open-source time awareness tool inspired by Persona 5:
focus deeply, rest intentionally, and pursue meaningful goals. Unlike
traditional time trackers that impose rigid schedules or guilt-trip users with
productivity metrics, Take Your Time helps you understand how you _actually_
spend your days—then make conscious choices about what matters.

## Core Philosophy

- **Awareness over optimization**: We're building a dashboard for your life, not
  an algorithmic life coach
- **Flexibility over rigidity**: Life doesn't follow perfect schedules; neither
  should your tracker
- **Intention over surveillance**: Log what matters to the user instead of what
  an algorithm thinks you should care about
- **Reflection over judgment**: Failed deadlines are data points for learning
  rather than permanent setbacks

## User Experience Flow

### The Day Structure: Five States

Every day flows through five states (not time blocks—states you transition
through consciously):

1. **Obligation 1**: Your primary commitment (work, school, morning routine)
2. **Free Time 1**: Recovery and choice time
3. **Obligation 2**: Secondary commitments (errands, evening responsibilities,
   focused work sessions)
4. **Free Time 2**: Second wind activities
5. **Rest/Reset**: Sleep and true downtime

**Key mechanic**: You're never "not in a state." You manually transition with a
single button: **"Go to Next Block"**

When transitioning:

- Optional: Log what you just did
- Optional: Set a minimum commitment timer for the next block
- Optional: Tag the activity (builds toward personal stats or calling card
  objectives)

### Calling Cards: Deadline System

Inspired by Persona 5's heist structure, **Calling Cards** are how you set and
track meaningful goals.

**Creating a Calling Card:**

1. Define the deadline (1-4 weeks is the sweet spot)
2. Write the "calling card message"—what you're committing to and why
3. Break it into sub-objectives (like the game's infiltration log)
4. Tag which activities during free time/obligation time contribute

**Completing/Failing a Calling Card:**

- **Success**: Card moves to your compendium with completion data
- **Didn't make it**: You get a reflection prompt: "What got in the way?" Then
  option to **Retry** with adjusted timeline
- All calling cards (successful or not) become part of your personal archive

### Personal Stats: Skills You're Building

Rather than predefined categories, you create your own stats organically:

- Log "practiced guitar" → Tag as "Music"
- Log "studied Korean" → Tag as "Language"
- Log "morning run" → Tag as "Fitness"

Over time, these accumulate into your personal stat sheet—visualized
Persona-style with progress bars. The app can suggest consolidating similar tags
("Coding" + "Programming" → merge?).

### Infiltration Log: Reflection Reports

Periodically (weekly/monthly), the app generates an **Infiltration Log**—a
summary you can review or ignore:

- Calling cards completed/in progress/retried
- Time distribution across blocks
- Activity-block trends
- Personal stat growth
- Basic pattern recognition ("You have more free time on Wednesdays")

Infiltration logs MUST be observational. "Here's what happened. What do you
notice?"

## Technical Architecture

### Stack

- **Frontend**: Flutter (iOS, Android, eventual web)
- **Backend**: TBD (local-first for MVP, optional self-hostable sync later)
- **Local Storage**: Hive for on-device data
- **State Management**: Riverpod
- **i18n**: flutter_localizations (multi-language from day one)

### Data Model (Simplified)

```dart
TimeBlock {
  id, type (obligation1/free1/etc), 
  startTime, endTime,
  activity (optional), 
  statTags (optional),
  callingCardId (optional)
}

CallingCard {
  id, title, description,
  deadline, subObjectives[],
  status (active/complete/retry),
  reflectionNotes (optional)
}

PersonalStat {
  id, name, activityCount
}
```

### Privacy & Data Ownership

- **Local-first**: All data stored on device by default
- **Export anytime**: JSON export of all data
- **No tracking**: Zero analytics/telemetry in the open source version

## MVP Feature Scope

**In scope for v1.0:**

- [ ] Five-state day structure with manual transitions
- [ ] Activity logging with optional timers
- [ ] Calling card creation/tracking/completion/retry
- [ ] Personal stat system with user-defined tags
- [ ] Infiltration log summaries
- [ ] Compendium (archive of calling cards)
- [ ] Local data storage + export
- [ ] Multi-language support (English to start)
- [ ] Persona 5-inspired UX (bold colors, sharp edges, dramatic transitions)

**Out of scope for v1.0:**

- [ ] Social features (shared calling cards, community)
- [ ] Cloud sync (can add later)
- [ ] Widgets (nice-to-have, not blocking)
- [ ] Web dashboard
- [ ] Deeper insights with (non-generative) AI

## Design Principles

### Visual Language

- **Typography**: Bold, high-contrast, angular headings
- **Shapes**: Diagonal cuts, mask overlays, sharp corners
- **Animations**: Snappy, confident transitions (not slow/floaty)
- **Tone**: Dramatic but not silly, empowering not patronizing
- **Color palette**: TBD (inspired by Persona 5 but focused on awareness without
  anxiety)

### UX Principles

- **One-tap actions**: Core flows should be fast (transition blocks, log
  activity)
- **No nagging**: Notifications are informational, never guilt-based
- **Friction where it matters**: Require confirmation for deleting data or
  ending timers early
- **Celebration over shame**: Completed calling cards get fanfare; missed ones
  get reflection prompts

## Success Metrics (Community Validation)

We'll know the MVP resonates if:

- **Time tracking enthusiasts** say "this solves my rigidity problem"
- **Persona 5 fans** say "this captures the vibe without being cringe"
- **Productivity skeptics** say "I'd actually use this because it's not judging
  me"
- **Developers** want to contribute (good architecture, clear roadmap)

## Open Questions for Community Feedback

1. Should "Rest/Reset" be strictly for sleep, or allow late-night activities?
2. How granular should free time logging be? (Every 20-minute activity vs
   overall vibe?)
3. Would you want optional "focus mode" during obligation blocks (block
   distracting apps)?
4. What makes a calling card feel meaningful vs just another deadline?

---

## Contributing

This is an open source project built by hauntedcupoftea. Contributions welcome
once the MVP is functional. See CONTRIBUTING.md (coming soon) for guidelines.

## License

TBD (likely MIT or GPL-3.0 for strong copyleft)
