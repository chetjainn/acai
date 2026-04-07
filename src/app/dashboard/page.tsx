import React from 'react';

const Dashboard: React.FC = () => {
  return (
    <div className="flex">
      <aside className="w-64 bg-gray-800 text-white h-screen">
        <div className="p-4">
          <h1 className="text-lg font-bold">ACAI Dashboard</h1>
        </div>
        <nav className="mt-4">
          <ul>
            <li className="p-2 hover:bg-gray-700"><a href="/">Home</a></li>
            <li className="p-2 hover:bg-gray-700"><a href="/agent-directory">Agent Directory</a></li>
            <li className="p-2 hover:bg-gray-700"><a href="/dashboard">Dashboard</a></li>
          </ul>
        </nav>
      </aside>

      <main className="flex-1 p-6 bg-gray-100">
        <header className="flex justify-between items-center mb-6">
          <h1 className="text-2xl font-semibold">Dashboard</h1>
        </header>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-lg font-bold">Total Agents</h2>
            <p className="text-3xl text-blue-600">150</p>
          </div>
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-lg font-bold">Active Agents</h2>
            <p className="text-3xl text-blue-600">120</p>
          </div>
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-lg font-bold">Pending Requests</h2>
            <p className="text-3xl text-blue-600">30</p>
          </div>
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-lg font-bold">Total Revenue</h2>
            <p className="text-3xl text-blue-600">$25,000</p>
          </div>
        </div>

        <div className="bg-white p-4 rounded shadow">
          <h2 className="text-lg font-bold mb-4">Recent Activity</h2>
          <div className="h-64 flex items-center justify-center border-2 border-dashed border-gray-300">
            <p className="text-gray-500">Data Table Placeholder</p>
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;