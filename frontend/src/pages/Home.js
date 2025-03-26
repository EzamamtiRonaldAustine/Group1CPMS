import React from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

const Home = () => {
  const { user } = useAuth();

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="container mx-auto px-4 py-16">
        <div className="text-center">
          <h1 className="text-4xl font-bold mb-4">Welcome to Job Portal</h1>
          <p className="text-xl text-gray-600 mb-8">
            Find your dream job or hire the perfect candidate
          </p>
          
          {!user ? (
            <div className="space-x-4">
              <Link
                to="/register"
                className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700"
              >
                Get Started
              </Link>
              <Link
                to="/login"
                className="bg-white text-blue-600 px-6 py-3 rounded-lg border border-blue-600 hover:bg-blue-50"
              >
                Login
              </Link>
            </div>
          ) : (
            <div className="space-x-4">
              {user.role === 'jobseeker' ? (
                <Link
                  to="/jobs"
                  className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700"
                >
                  Browse Jobs
                </Link>
              ) : (
                <Link
                  to="/post-job"
                  className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700"
                >
                  Post a Job
                </Link>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Home; 