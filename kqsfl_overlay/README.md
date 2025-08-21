# KQSFL Overlay Application

A Next.js application that displays streaming overlays with a 16:9 aspect ratio display.

## Features

- 16:9 aspect ratio display component
- Reusable React components
- Responsive design with Tailwind CSS
- TypeScript support

## Getting Started

### Prerequisites

- Node.js 18+ 
- npm or yarn

### Installation

```bash
npm install
```

### Development

Run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the application.

### Production

Build for production:

```bash
npm run build
```

Start the production server:

```bash
npm run start
```

## Components

### AspectRatioBox
Displays a centered 16:9 rectangle with gradient background.

### StreamOverlay
Customizable overlay component for streaming displays with title, subtitle, and optional statistics.

### Container
Responsive container component with configurable max-width settings.

## Project Structure

```
kqsfl_overlay/
├── app/                # Next.js app directory
│   ├── layout.tsx     # Root layout
│   └── page.tsx       # Home page
├── components/        # Reusable React components
│   ├── AspectRatioBox.tsx
│   ├── Container.tsx
│   └── StreamOverlay.tsx
├── styles/           # Global styles
│   └── globals.css
├── public/           # Static assets
└── package.json      # Dependencies and scripts
```