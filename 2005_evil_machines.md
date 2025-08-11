# Evil Machines (2005)

![Evil Machines Screenshot 1](2005_evil_machines_screenshot1.jpg)

![Evil Machines Screenshot 2](2005_evil_machines_screenshot2.jpg)

## Summary
- An isometric, turn-based multiplayer strategy game with gameplay comparable to XCOM and Laser Squad Nemesis.
- Widely cited as the first cross-platform game to support seamless play between PC and mobile devices.

## Recognition
- Winner, Dare to be Digital competition, 2005.

## Development Overview
- **Timeline:** 12 weeks.
- **Team:** This was the first game we worked on together; two of us collaborated before our company was formally established and have continued to work together since.
- **Goal:** Achieve feature-parity multiplayer strategy gameplay across PC web and early mobile hardware in an era before cross-platform engines or services existed.

## Platforms and Modes
- **PC:** Web-based client.
- **Mobile:** Java mobile application (e.g., compatible with Nokia-era devices).
- **Play model:** Turn-based; players could take their turns on either platform, with a shared, authoritative game state.

## Key Innovations
- **Cross-platform parity:** Delivered the same core gameplay loop on two fundamentally different technology stacks at the same time, establishing a new model for multi-device play.
- **Runtime palette swapping:** Invented a lightweight method to visually differentiate teams on memory-constrained devices by changing color palettes at runtime instead of loading separate sprite sets.
- **Mobile-first strategy UX:** Designed an interface for strategic play on early mobile phones, where screen size, input methods, and processing power were significant constraints.
- **Server-authoritative architecture:** Centralized rules and state management to ensure consistency across platforms, enabling reliable cross-device turns.

## Technical Architecture
- **Web architecture for cross-platform play:** A server mediated all interactions, ensuring that both the PC web client and the mobile Java app operated against the same game state.
- **Data flow:** Clients submitted turn instructions to a backend using server-side SQL queries and processing logic; the server validated, resolved, and persisted results before broadcasting updates.
- **Thin-client design:** Clients focused on input, rendering, and state display, while game logic and rule resolution occurred on the server to guarantee determinism across platforms.
- **Resource optimization:** Addressed severe memory limits on mobile devices by minimizing asset footprints, employing palette swaps, and carefully managing loading to avoid exceeding device capabilities.

## Development Challenges
When mobile strategy gameplay was still largely uncharted, we relied on iterative UX prototypes tuned to keypad input, small screens, and short sessions, pairing them with clean, isometric visuals optimized for quick readability. To ensure identical play across a heterogeneous device landscape, we moved rule execution to the server and implemented a database-backed turn system so outcomes stayed unified and free of platform-specific quirks. Finally, because tight memory budgets ruled out unique art for every player, we differentiated teams through runtime palette swaps and extensive sprite reuse, delivering variety without increasing the footprint.

## Impact and Legacy
- Established a working pattern for cross-platform, turn-based multiplayer years before mainstream engines and services supported it.
- Demonstrated that PC and mobile clients could share a single, authoritative game state with consistent mechanics and user experience.
- Laid the technical and collaborative foundation for our subsequent work; the partnership formed during this project continued as our company evolved.

## Notable Firsts
- Our first real game developed as the team that became our company.
- Widely recognized as the first cross-platform game operating simultaneously across PC web and mobile phone technologies.