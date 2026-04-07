import React from 'react';

const Dashboard: React.FC = () => {
  return (
    <div className="flex">
      <aside className="w-1/4 bg-gray-800 text-white p-5">
        <h2 className="text-2xl font-bold mb-6">ACAI</h2>
        <nav>
          <ul>
            <li className="mb-4"><a href="#" className="hover:text-gray-400">Dashboard</a></li>
            <li className="mb-4"><a href="#" className="hover:text-gray-400">Agent Directory</a></li>
            <li className="mb-4"><a href="#" className="hover:text-gray-400">Marketplace</a></li>
            <li className="mb-4"><a href="#" className="hover:text-gray-400">Settings</a></li>
          </ul>
        </nav>
      </aside>
      <main className="flex-1 p-10">
        <header className="mb-6">
          <h1 className="text-3xl font-bold">Dashboard</h1>
        </header>
        <section className="grid grid-cols-3 gap-6 mb-6">
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Active Agents</h3>
            <p className="text-2xl">120</p>
          </div>
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Total Transactions</h3>
            <p className="text-2xl">340</p>
          </div>
          <div className="bg-white p-5 rounded shadow">
            <h3 className="text-xl font-semibold">Revenue</h3>
            <p className="text-2xl">$15,000</p>
          </div>
        </section>
        <section className="bg-white p-5 rounded shadow">
          <h2 className="text-2xl font-semibold mb-4">Recent Transactions</h2>
          <table className="min-w-full border border-gray-300">
            <thead>
              <tr className="bg-gray-100">
                <th className="px-4 py-2 border-b">Agent</th>
                <th className="px-4 py-2 border-b">Transaction ID</th>
                <th className="px-4 py-2 border-b">Amount</th>
                <th className="px-4 py-2 border-b">Date</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td className="px-4 py-2 border-b">Agent A</td>
                <td className="px-4 py-2 border-b">T12345</td>
                <td className="px-4 py-2 border-b">$100</td>
                <td className="px-4 py-2 border-b">01/01/2023</td>
              </tr>
              <tr>
                <td className="px-4 py-2 border-b">Agent B</td>
                <td className="px-4 py-2 border-b">T12346</td>
                <td className="px-4 py-2 border-b">$200</td>
                <td className="px-4 py-2 border-b">01/02/2023</td>
              </tr>
            </tbody>
          </table>
        </section>
      </main>
    </div>
  );
};

export default Dashboard;