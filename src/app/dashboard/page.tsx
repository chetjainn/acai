import React from 'react';

const Dashboard: React.FC = () => {
  return (
    <div className="flex">
      {/* Sidebar */}
      <aside className="w-64 h-screen bg-gray-800 text-white p-5">
        <h2 className="text-2xl font-semibold mb-5">ACAI Dashboard</h2>
        <nav>
          <ul>
            <li className="mb-4"><a href="#" className="text-gray-300 hover:text-white">Home</a></li>
            <li className="mb-4"><a href="#" className="text-gray-300 hover:text-white">Agents</a></li>
            <li className="mb-4"><a href="#" className="text-gray-300 hover:text-white">Deployments</a></li>
            <li className="mb-4"><a href="#" className="text-gray-300 hover:text-white">Settings</a></li>
          </ul>
        </nav>
      </aside>

      {/* Main Content */}
      <main className="flex-1 p-10">
        {/* Header */}
        <header className="flex justify-between items-center mb-5">
          <h1 className="text-3xl font-bold">Welcome to ACAI</h1>
        </header>

        {/* Stat Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-5">
          <div className="bg-white p-5 rounded-lg shadow">
            <h2 className="text-lg font-semibold">Total Agents</h2>
            <p className="text-2xl">123</p>
          </div>
          <div className="bg-white p-5 rounded-lg shadow">
            <h2 className="text-lg font-semibold">Active Deployments</h2>
            <p className="text-2xl">42</p>
          </div>
          <div className="bg-white p-5 rounded-lg shadow">
            <h2 className="text-lg font-semibold">New Users</h2>
            <p className="text-2xl">15</p>
          </div>
        </div>

        {/* Data Table Placeholder */}
        <div className="bg-white p-5 rounded-lg shadow">
          <h2 className="text-lg font-semibold mb-4">Recent Activity</h2>
          <div className="h-64 border-2 border-dashed border-gray-300 flex items-center justify-center text-gray-400">
            Data Table Placeholder
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;