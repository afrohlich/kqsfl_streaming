'use client'

import React from 'react'

interface StreamOverlayProps {
  title?: string
  subtitle?: string
  showStats?: boolean
}

const StreamOverlay: React.FC<StreamOverlayProps> = ({ 
  title = 'KQSFL', 
  subtitle = 'Live Stream',
  showStats = false 
}) => {
  return (
    <div className="stream-overlay">
      <div className="overlay-header">
        <h1>{title}</h1>
        <p>{subtitle}</p>
      </div>
      {showStats && (
        <div className="overlay-stats">
          <div className="stat-item">
            <span className="stat-label">Viewers:</span>
            <span className="stat-value">0</span>
          </div>
          <div className="stat-item">
            <span className="stat-label">Duration:</span>
            <span className="stat-value">00:00:00</span>
          </div>
        </div>
      )}
    </div>
  )
}

export default StreamOverlay