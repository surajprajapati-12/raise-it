#!/bin/bash

echo "🚀 Grievance Portal Deployment Setup"
echo "====================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not found. Please initialize git first:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo "   git remote add origin <your-github-repo-url>"
    echo "   git push -u origin main"
    exit 1
fi

# Check if .env files exist
echo "📋 Checking environment files..."

if [ ! -f "server/.env" ]; then
    echo "⚠️  server/.env not found. Please create it with your credentials:"
    echo "   Copy server/env.example to server/.env and fill in your values"
fi

if [ ! -f "client/.env" ]; then
    echo "⚠️  client/.env not found. Please create it with your credentials:"
    echo "   Copy client/env.example to client/.env and fill in your values"
fi

# Check dependencies
echo "📦 Checking dependencies..."

echo "Installing backend dependencies..."
cd server
npm install
cd ..

echo "Installing frontend dependencies..."
cd client
npm install
cd ..

# Test builds
echo "🔨 Testing builds..."

echo "Testing backend..."
cd server
npm run build
cd ..

echo "Testing frontend..."
cd client
npm run build
cd ..

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Push your code to GitHub:"
echo "   git add ."
echo "   git commit -m 'Prepare for deployment'"
echo "   git push"
echo ""
echo "2. Deploy backend to Render:"
echo "   - Go to render.com"
echo "   - Create new Web Service"
echo "   - Connect your GitHub repo"
echo "   - Set root directory to 'server'"
echo "   - Add environment variables"
echo ""
echo "3. Deploy frontend to Vercel:"
echo "   - Go to vercel.com"
echo "   - Create new project"
echo "   - Import your GitHub repo"
echo "   - Set root directory to 'client'"
echo "   - Add environment variables"
echo ""
echo "📚 See DEPLOYMENT_GUIDE.md for detailed instructions"
