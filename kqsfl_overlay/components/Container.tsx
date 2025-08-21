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
  const maxWidthClasses = {
    sm: 'max-w-2xl',
    md: 'max-w-4xl',
    lg: 'max-w-6xl',
    xl: 'max-w-7xl',
    full: 'max-w-full'
  }

  return (
    <div className={`container mx-auto px-4 ${maxWidthClasses[maxWidth]} ${className}`}>
      {children}
    </div>
  )
}

export default Container