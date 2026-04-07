import React from 'react';

const Dashboard = () => {
  return (
    <div className="flex">
      <aside className="w-64 h-screen bg-gray-800 text-white p-4">
        <h2 className="text-xl font-bold mb-6">ACAI Dashboard</h2>
        <nav>
          <ul>
            <li className="mb-4">
              <a href="#" className="hover:text-gray-400">Home</a>
            </li>
            <li className="mb-4">
              <a href="#" className="hover:text-gray-400">Agents</a>
            </li>
            <li className="mb-4">
              <a href="#" className="hover:text-gray-400">Marketplace</a>
            </li>
            <li className="mb-4">
              <a href="#" className="hover:text-gray-400">Settings</a>
            </li>
          </ul>
        </nav>
      </aside>
      <main className="flex-1 p-6 bg-gray-100">
        <header className="mb-6">
          <h1 className="text-3xl font-semibold">Welcome to ACAI</h1>
        </header>
        <section className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <div className="bg-white shadow rounded p-4 text-center">
            <h2 className="text-lg font-semibold">Total Agents</h2>
            <p className="text-2xl font-bold">150</p>
          </div>
          <div className="bg-white shadow rounded p-4 text-center">
            <h2 className="text-lg font-semibold">Active Agents</h2>
            <p className="text-2xl font-bold">85</p>
          </div>
          <div className="bg-white shadow rounded p-4 text-center">
            <h2 className="text-lg font-semibold">Pending Deployments</h2>
            <p className="text-2xl font-bold">5</p>
          </div>
        </section>
        <section className="bg-white shadow rounded p-6">
          <h2 className="text-xl font-semibold mb-4">Agents Overview</h2>
          <table className="min-w-full border-collapse">
            <thead>
              <tr className="border-b">
                <th className="text-left p-2">Agent Name</th>
                <th className="text-left p-2">Status</th>
                <th className="text-left p-2">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr className="border-b">
                <td className="p-2">Agent Alpha</td>
                <td className="p-2">Active</td>
                <td className="p-2">
                  <button className="text-blue-500">View</button>
                </td>
              </tr>
              <tr className="border-b">
                <td className="p-2">Agent Beta</td>
                <td className="p-2">Inactive</td>
                <td className="p-2">
                  <button className="text-blue-500">View</button>
                </td>
              </tr>
            </tbody>
          </table>
        </section>
      </main>
    </div>
  );
};

export default Dashboard;