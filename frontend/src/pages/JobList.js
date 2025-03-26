import React, { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';

const JobList = () => {
  const [jobs, setJobs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const { user } = useAuth();

  useEffect(() => {
    fetchJobs();
  }, []);

  const fetchJobs = async () => {
    try {
      const response = await fetch('http://localhost:5000/api/jobs');
      const data = await response.json();
      if (!response.ok) throw new Error(data.error);
      setJobs(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleApply = async (jobId) => {
    try {
      const response = await fetch(`http://localhost:5000/api/jobs/${jobId}/apply`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
      
      const data = await response.json();
      if (!response.ok) throw new Error(data.error);
      
      alert('Application submitted successfully!');
    } catch (err) {
      setError(err.message);
    }
  };

  if (loading) return <div className="text-center p-4">Loading...</div>;
  if (error) return <div className="text-red-500 text-center p-4">{error}</div>;

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4">Available Jobs</h1>
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {jobs.map(job => (
          <div key={job.id} className="border p-4 rounded shadow">
            <h2 className="text-xl font-bold">{job.title}</h2>
            <p className="text-gray-600">{job.company_name}</p>
            <p className="mt-2">{job.description}</p>
            <div className="mt-4">
              <span className="text-sm bg-blue-100 text-blue-800 px-2 py-1 rounded">
                {job.job_type}
              </span>
              <span className="ml-2 text-sm bg-green-100 text-green-800 px-2 py-1 rounded">
                {job.salary_range}
              </span>
            </div>
            {user?.role === 'jobseeker' && (
              <button
                onClick={() => handleApply(job.id)}
                className="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"
              >
                Apply Now
              </button>
            )}
          </div>
        ))}
      </div>
    </div>
  );
};

export default JobList; 