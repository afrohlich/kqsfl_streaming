'use client'

import React from 'react'

interface ContainerProps {
  children: React.ReactNode
  className?: string
  maxWidth?: 'sm' | 'md' | 'lg' | 'xl' | 'full'
}

const Container: React.FC<ContainerProps> = ({ 
  children, 
  className = '',
  maxWidth = 'lg'
}) => {
  const maxWidthClass = `max-width-${maxWidth}`

  return (
    <div className={`container ${maxWidthClass} ${className}`.trim()}>
      {children}
    </div>
  )
}

export default Container