# Deployment Guide for Grievance Portal

This guide will help you deploy your Grievance Portal application to Vercel (frontend) and Render (backend).

## Prerequisites

1. **GitHub Account** - Your code should be in a GitHub repository
2. **Vercel Account** - Sign up at [vercel.com](https://vercel.com)
3. **Render Account** - Sign up at [render.com](https://render.com)
4. **MongoDB Atlas Account** - For database hosting

## Required Credentials

### 1. MongoDB Atlas
- **Connection String**: `mongodb+srv://username:password@cluster.mongodb.net/database_name`
- **Username**: Your MongoDB username
- **Password**: Your MongoDB password
- **Cluster URL**: Your cluster address

### 2. JWT Secret
- **JWT_SECRET**: A strong, random string for authentication tokens
- Generate one using: `node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"`

### 3. Email Service (if using nodemailer)
- **EMAIL_USER**: Your Gmail address
- **EMAIL_PASS**: Your Gmail app password (not regular password)

### 4. Twilio (if using SMS features)
- **TWILIO_ACCOUNT_SID**: From your Twilio dashboard
- **TWILIO_AUTH_TOKEN**: From your Twilio dashboard
- **TWILIO_PHONE_NUMBER**: Your Twilio phone number

## Backend Deployment on Render

### Step 1: Prepare Your Repository
1. Ensure your `server/` folder contains:
   - `package.json` with proper scripts
   - `app.js` as the main file
   - All required dependencies

### Step 2: Deploy to Render
1. Go to [render.com](https://render.com) and sign in
2. Click "New +" and select "Web Service"
3. Connect your GitHub repository
4. Configure the service:
   - **Name**: `grievance-backend` (or your preferred name)
   - **Root Directory**: `server`
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free (or paid if needed)

### Step 3: Set Environment Variables
In Render dashboard, go to your service → Environment → Add the following:

```
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/database_name
JWT_SECRET=your_generated_jwt_secret
NODE_ENV=production
FRONTEND_URL=https://your-frontend-domain.vercel.app
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_gmail_app_password
TWILIO_ACCOUNT_SID=your_twilio_sid
TWILIO_AUTH_TOKEN=your_twilio_token
TWILIO_PHONE_NUMBER=your_twilio_phone
```

### Step 4: Deploy
1. Click "Create Web Service"
2. Wait for the build to complete
3. Note your service URL (e.g., `https://grievance-backend.onrender.com`)

## Frontend Deployment on Vercel

### Step 1: Prepare Your Repository
1. Ensure your `client/` folder contains:
   - `package.json` with build scripts
   - `vercel.json` configuration
   - All required dependencies

### Step 2: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com) and sign in
2. Click "New Project"
3. Import your GitHub repository
4. Configure the project:
   - **Framework Preset**: Vite
   - **Root Directory**: `client`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
   - **Install Command**: `npm install`

### Step 3: Set Environment Variables
In Vercel dashboard, go to your project → Settings → Environment Variables:

```
VITE_API_URL=https://your-backend-domain.onrender.com
VITE_API_BASE_URL=https://your-backend-domain.onrender.com/api/v1
```

### Step 4: Deploy
1. Click "Deploy"
2. Wait for the build to complete
3. Your app will be available at `https://your-project.vercel.app`

## Post-Deployment Steps

### 1. Update CORS in Backend
Ensure your backend CORS configuration includes your frontend domain.

### 2. Test Your Application
1. Test user registration and login
2. Test complaint creation
3. Test all major functionalities
4. Check console for any errors

### 3. Monitor Logs
- **Render**: Check logs in your service dashboard
- **Vercel**: Check function logs in your project dashboard

## Troubleshooting

### Common Issues:

1. **CORS Errors**: Ensure frontend URL is added to backend CORS origins
2. **Database Connection**: Verify MongoDB connection string and network access
3. **Environment Variables**: Double-check all variables are set correctly
4. **Build Errors**: Check package.json scripts and dependencies

### Debug Commands:
```bash
# Check backend logs
# In Render dashboard → Logs

# Check frontend build
npm run build

# Test backend locally
cd server
npm start
```

## Security Notes

1. **Never commit `.env` files** to your repository
2. **Use strong JWT secrets**
3. **Enable MongoDB network access** only from your Render service
4. **Use HTTPS** in production (handled by Vercel/Render)

## Cost Considerations

- **Vercel**: Free tier available, paid plans for advanced features
- **Render**: Free tier available, paid plans for better performance
- **MongoDB Atlas**: Free tier available, paid plans for more storage/connections

## Support

- **Vercel**: [vercel.com/docs](https://vercel.com/docs)
- **Render**: [render.com/docs](https://render.com/docs)
- **MongoDB Atlas**: [docs.atlas.mongodb.com](https://docs.atlas.mongodb.com)
