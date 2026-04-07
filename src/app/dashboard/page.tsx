import React from 'react';
import Link from 'next/link';

const Dashboard: React.FC = () => {
  return (
    <div className="flex h-screen">
      <aside className="w-64 bg-gray-800 p-6 text-white">
        <h2 className="text-2xl mb-4">ACAI Dashboard</h2>
        <nav>
          <ul>
            <li className="mb-2">
              <Link href="/dashboard">
                <a className="hover:text-gray-400">Home</a>
              </Link>
            </li>
            <li className="mb-2">
              <Link href="/agents">
                <a className="hover:text-gray-400">Agents</a>
              </Link>
            </li>
            <li className="mb-2">
              <Link href="/settings">
                <a className="hover:text-gray-400">Settings</a>
              </Link>
            </li>
            <li>
              <Link href="/support">
                <a className="hover:text-gray-400">Support</a>
              </Link>
            </li>
          </ul>
        </nav>
      </aside>
      
      <main className="flex-1 bg-gray-100 p-6">
        <header className="flex justify-between items-center mb-6">
          <h1 className="text-3xl font-bold">Dashboard</h1>
        </header>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
          <div className="bg-white p-4 rounded-lg shadow">
            <h3 className="text-xl font-semibold">Total Agents</h3>
            <p className="text-2xl">150</p>
          </div>
          <div className="bg-white p-4 rounded-lg shadow">
            <h3 className="text-xl font-semibold">Active Agents</h3>
            <p className="text-2xl">120</p>
          </div>
          <div className="bg-white p-4 rounded-lg shadow">
            <h3 className="text-xl font-semibold">Pending Requests</h3>
            <p className="text-2xl">30</p>
          </div>
        </div>

        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-2xl font-semibold mb-4">Agent Data Table</h2>
          <div className="h-64 flex items-center justify-center">
            <p className="text-gray-400">Data table is currently under construction.</p>
          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;