import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

const Navbar = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <nav className="bg-blue-600 p-4">
      <div className="container mx-auto flex justify-between items-center">
        <Link to="/" className="text-white text-xl font-bold">Job Portal</Link>
        <div className="flex space-x-4">
          <Link to="/jobs" className="text-white">Jobs</Link>
          {user ? (
            <>
              {user.role === 'employer' && (
                <Link to="/post-job" className="text-white">Post Job</Link>
              )}
              {user.role === 'jobseeker' && (
                <Link to="/applications" className="text-white">My Applications</Link>
              )}
              <button onClick={handleLogout} className="text-white">Logout</button>
            </>
          ) : (
            <>
              <Link to="/login" className="text-white">Login</Link>
              <Link to="/register" className="text-white">Register</Link>
            </>
          )}
        </div>
      </div>
    </nav>
  );
};

export default Navbar; 