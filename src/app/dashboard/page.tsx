import React from 'react';

const Dashboard: React.FC = () => {
  return (
    <div className="flex">
      <aside className="w-64 bg-gray-800 text-white h-screen">
        <div className="p-4 text-center text-2xl">ACAI</div>
        <nav className="mt-10">
          <ul>
            <li className="p-2 hover:bg-gray-700"><a href="/">Home</a></li>
            <li className="p-2 hover:bg-gray-700"><a href="/agents">Agents</a></li>
            <li className="p-2 hover:bg-gray-700"><a href="/dashboard">Dashboard</a></li>
          </ul>
        </nav>
      </aside>
      
      <main className="flex-grow p-6 bg-gray-100">
        <header className="flex justify-between items-center mb-4">
          <h1 className="text-3xl font-bold">Dashboard</h1>
        </header>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mb-6">
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-xl font-semibold">Total Agents</h2>
            <p className="text-2xl">150</p>
          </div>
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-xl font-semibold">Active Users</h2>
            <p className="text-2xl">320</p>
          </div>
          <div className="bg-white p-4 rounded shadow">
            <h2 className="text-xl font-semibold">Deployments</h2>
            <p className="text-2xl">200</p>
          </div>
        </div>

        <div className="bg-white p-4 rounded shadow">
          <h2 className="text-xl font-semibold mb-4">Agent Data Table</h2>
          <div className="h-64 border border-gray-300 rounded">
            {/* Placeholder for Data Table */}
            <p className="text-center pt-24 text-gray-400">Data table goes here</p>
          </div>
        </div>
      </main>
    </div>
  );
}

export default Dashboard;