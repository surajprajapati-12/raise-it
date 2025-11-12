# 🚀 Grievance Portal - Government of India Initiative

A comprehensive digital platform for citizens to file and track grievances, built with modern web technologies and deployed on cloud platforms.

## 🌟 Features

### 👥 User Management
- **User Registration & Authentication** - Secure JWT-based authentication
- **Profile Management** - Update personal information and preferences
- **Role-based Access Control** - User, Officer, and Admin roles

### 📝 Grievance Management
- **File New Complaints** - Submit grievances with location tracking
- **Status Tracking** - Real-time updates on complaint progress
- **Document Upload** - Attach supporting documents and images
- **Priority Classification** - Automatic priority assignment based on type

### 👮‍♂️ Officer Dashboard
- **Task Assignment** - Officers receive and manage assigned complaints
- **Status Updates** - Update complaint status and add notes
- **Performance Metrics** - Track resolution time and success rates
- **Rating System** - Citizens can rate officer performance

### 🏛️ Admin Panel
- **Complaint Overview** - Comprehensive dashboard with analytics
- **User Management** - Manage all users and officers
- **System Monitoring** - Track system performance and usage
- **Report Generation** - Generate detailed reports and insights

### 📱 Modern UI/UX
- **Responsive Design** - Works seamlessly on all devices
- **Dark/Light Theme** - User preference-based theming
- **Real-time Updates** - Live status updates and notifications
- **Accessibility** - WCAG compliant design

## 🛠️ Technology Stack

### Frontend
- **React 18** - Modern React with hooks and functional components
- **Vite** - Fast build tool and development server
- **Tailwind CSS** - Utility-first CSS framework
- **React Router** - Client-side routing
- **Axios** - HTTP client for API calls

### Backend
- **Node.js** - JavaScript runtime environment
- **Express.js** - Web application framework
- **MongoDB** - NoSQL database with Mongoose ODM
- **JWT** - JSON Web Token authentication
- **bcryptjs** - Password hashing and security

### Infrastructure
- **Vercel** - Frontend hosting and deployment
- **Render** - Backend hosting and deployment
- **MongoDB Atlas** - Cloud database hosting
- **GitHub** - Version control and collaboration

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- MongoDB Atlas account
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/optimus-prime-01/raise-it.git
   cd raise-it
   ```

2. **Install dependencies**
   ```bash
   # Install backend dependencies
   cd server
   npm install
   
   # Install frontend dependencies
   cd ../client
   npm install
   ```

3. **Environment Setup**
   
   **Backend (.env in server folder):**
   ```bash
   MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/grievance_portal
   JWT_SECRET=your_jwt_secret_here
   JWT_EXPIRES_IN=30d
   NODE_ENV=development
   EMAIL_USER=your_email@gmail.com
   EMAIL_PASS=your_email_password
   ```

   **Frontend (.env in client folder):**
   ```bash
   VITE_API_URL=http://localhost:3000
   VITE_API_BASE_URL=http://localhost:3000/api/v1
   ```

4. **Start development servers**
   ```bash
   # Start backend (from server folder)
   npm run dev
   
   # Start frontend (from client folder, in new terminal)
   npm run dev
   ```

5. **Access the application**
   - Frontend: http://localhost:5173
   - Backend: http://localhost:3000

## 🌐 Production Deployment

### Frontend (Vercel)
1. Connect your GitHub repository to Vercel
2. Set environment variables:
   ```bash
   VITE_API_URL=https://your-backend-domain.onrender.com
   VITE_API_BASE_URL=https://your-backend-domain.onrender.com/api/v1
   ```
3. Deploy with Vite framework preset

### Backend (Render)
1. Create new Web Service on Render
2. Connect your GitHub repository
3. Set root directory to `server`
4. Configure environment variables:
   ```bash
   MONGO_URI=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret
   JWT_EXPIRES_IN=30d
   NODE_ENV=production
   EMAIL_USER=your_email
   EMAIL_PASS=your_email_password
   ```

## 📁 Project Structure

```
raise-it/
├── client/                 # Frontend React application
│   ├── src/
│   │   ├── Components/    # React components
│   │   ├── services/      # API service functions
│   │   ├── data/          # Static data and constants
│   │   └── Images/        # Image assets
│   ├── public/            # Public assets
│   └── package.json       # Frontend dependencies
├── server/                 # Backend Node.js application
│   ├── controllers/        # Request handlers
│   ├── models/            # Database models
│   ├── routes/            # API route definitions
│   ├── middleware/        # Custom middleware
│   ├── db/                # Database connection
│   └── package.json       # Backend dependencies
├── docs/                   # Documentation files
└── README.md              # This file
```

## 🔐 Security Features

- **JWT Authentication** - Secure token-based authentication
- **Password Hashing** - bcryptjs for secure password storage
- **CORS Protection** - Configured for production domains
- **Rate Limiting** - API rate limiting to prevent abuse
- **Input Validation** - Comprehensive input sanitization
- **Helmet.js** - Security headers and protection

## 📊 API Documentation

### Authentication Endpoints
- `POST /api/v1/auth/register` - User registration
- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/forgot-password` - Password reset request
- `POST /api/v1/auth/reset-password` - Password reset

### User Endpoints
- `GET /api/v1/user/profile` - Get user profile
- `PATCH /api/v1/user/profile` - Update user profile

### Complaint Endpoints
- `POST /api/v1/complaints` - Create new complaint
- `GET /api/v1/complaints` - Get user complaints
- `GET /api/v1/complaints/:id` - Get complaint details

### Admin Endpoints
- `GET /api/v1/manage/complaints` - Get all complaints
- `PATCH /api/v1/manage/complaints/:id` - Update complaint status

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Government of India** - For the initiative and vision
- **Open Source Community** - For the amazing tools and libraries
- **Contributors** - For their valuable contributions


## 🌟 Live Demo

- **Frontend**: [https://raise-it-mms3.vercel.app](https://raise-it-mms3.vercel.app)
- **Backend API**: [https://raise-it-two.vercel.app](https://raise-it-two.vercel.app)

---

**Made with ❤️ for Digital India Initiative**
