import axios from "axios";

// Base API configuration
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:3000/api/v1';

// Create axios instance with base configuration
const apiClient = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    "Content-Type": "application/json",
  },
  withCredentials: true,
});

// Request interceptor to add auth token
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor for error handling
apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export default {
  // Auth services
  register: (userData) => apiClient.post('/auth/register', userData),
  login: (credentials) => apiClient.post('/auth/login', credentials),
  logout: () => apiClient.post('/auth/logout'),
  
  // User services
  getUserProfile: () => apiClient.get('/user/profile'),
  updateUserProfile: (userData) => apiClient.patch('/user/profile', userData),
  
  // Complaint services
  createComplaint: (complaintData) => apiClient.post('/complaints', complaintData),
  getUserComplaints: () => apiClient.get('/complaints'),
  getComplaintStatus: (complaintId) => apiClient.get(`/complaints/${complaintId}`),
  
  // Officer services
  getOfficerDetails: (officerId) => apiClient.get(`/officer/${officerId}`),
  
  // Admin services
  getAllComplaints: () => apiClient.get('/manage/complaints'),
  updateComplaintStatus: (complaintId, statusData) => apiClient.patch(`/manage/complaints/${complaintId}`, statusData),
  
  // Generic method for other API calls
  request: (config) => apiClient.request(config),
};



