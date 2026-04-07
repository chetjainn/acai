import React from 'react';

const Dashboard = () => {
  return (
    <div className="flex h-screen">
      <aside className="w-64 bg-gray-800 text-white p-5">
        <h1 className="text-2xl mb-5">ACAI Dashboard</h1>
        <nav>
          <ul>
            <li className="py-2 hover:bg-gray-700 px-3 rounded">
              <a href="/">Home</a>
            </li>
            <li className="py-2 hover:bg-gray-700 px-3 rounded">
              <a href="/agents">Agent Directory</a>
            </li>
            <li className="py-2 hover:bg-gray-700 px-3 rounded">
              <a href="/dashboard">Dashboard</a>
            </li>
          </ul>
        </nav>
      </aside>

      <main className="flex-1 bg-gray-100 p-5">
        <header className="flex justify-between items-center mb-5">
          <h1 className="text-3xl font-bold">Dashboard</h1>
        </header>

        <section className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-5">
          <div className="bg-white p-5 rounded shadow-md">
            <h2 className="text-xl font-semibold">Total Agents</h2>
            <p className="text-2xl">150</p>
          </div>
          <div className="bg-white p-5 rounded shadow-md">
            <h2 className="text-xl font-semibold">Active Agents</h2>
            <p className="text-2xl">120</p>
          </div>
          <div className="bg-white p-5 rounded shadow-md">
            <h2 className="text-xl font-semibold">New Registrations</h2>
            <p className="text-2xl">10</p>
          </div>
        </section>

        <section className="bg-white rounded shadow-md p-5">
          <h2 className="text-xl font-semibold mb-3">Agent Data Table</h2>
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-300">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Last Active</th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                <tr>
                  <td className="px-6 py-4 whitespace-nowrap">Agent A</td>
                  <td className="px-6 py-4 whitespace-nowrap">Active</td>
                  <td className="px-6 py-4 whitespace-nowrap">2 days ago</td>
                </tr>
                <tr>
                  <td className="px-6 py-4 whitespace-nowrap">Agent B</td>
                  <td className="px-6 py-4 whitespace-nowrap">Inactive</td>
                  <td className="px-6 py-4 whitespace-nowrap">N/A</td>
                </tr>
                <tr>
                  <td className="px-6 py-4 whitespace-nowrap">Agent C</td>
                  <td className="px-6 py-4 whitespace-nowrap">Active</td>
                  <td className="px-6 py-4 whitespace-nowrap">1 week ago</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </main>
    </div>
  );
};

export default Dashboard;