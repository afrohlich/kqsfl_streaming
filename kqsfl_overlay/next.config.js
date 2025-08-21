/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  output: 'standalone',
  
  // Custom server configuration
  serverRuntimeConfig: {
    port: process.env.PORT || 3000
  },
  
  // Public runtime configuration
  publicRuntimeConfig: {
    apiUrl: process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3000'
  }
}

module.exports = nextConfig