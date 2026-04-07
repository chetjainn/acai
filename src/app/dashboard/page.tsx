import { useState } from 'react';

const Dashboard = () => {
  const [data, setData] = useState([]);

  return (
    <div className="flex h-screen bg-gray-100">
      <aside className="w-64 bg-white shadow-md">
        <div className="p-5">
          <h2 className="text-2xl font-bold text-center">ACAI</h2>
        </div>
        <nav className="mt-5">
          <ul>
            <li className="p-4 hover:bg-gray-200">Home</li>
            <li className="p-4 hover:bg-gray-200">Agent Directory</li>
            <li className="p-4 hover:bg-gray-200">Dashboard</li>
            <li className="p-4 hover:bg-gray-200">Settings</li>
            <li className="p-4 hover:bg-gray-200">Logout</li>
          </ul>
        </nav>
      </aside>
      <main className="flex-grow p-6">
        <header className="mb-6">
          <h1 className="text-3xl font-semibold">Dashboard</h1>
        </header>
        <div className="grid grid-cols-3 gap-6 mb-6">
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Total Agents</h3>
            <p className="text-3xl">150</p>
          </div>
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Active Agents</h3>
            <p className="text-3xl">120</p>
          </div>
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Pending Reviews</h3>
            <p className="text-3xl">5</p>
          </div>
        </div>
        <div className="bg-white rounded shadow">
          <header className="p-4 border-b">
            <h2 className="text-xl font-semibold">Agents Overview</h2>
          </header>
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Agent Name</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Performance</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {/* Placeholder for data rows */}
              <tr>
                <td className="px-6 py-4 whitespace-nowrap">John Doe</td>
                <td className="px-6 py-4 whitespace-nowrap">Active</td>
                <td className="px-6 py-4 whitespace-nowrap">High</td>
              </tr>
              <tr>
                <td className="px-6 py-4 whitespace-nowrap">Jane Smith</td>
                <td className="px-6 py-4 whitespace-nowrap">Pending</td>
                <td className="px-6 py-4 whitespace-nowrap">Medium</td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;