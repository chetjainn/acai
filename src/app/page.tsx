export default function LandingPage() {
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Hero Section */}
      <section className="flex flex-col items-center justify-center h-screen bg-gradient-to-r from-blue-400 to-purple-600 text-white">
        <h1 className="text-5xl font-bold mb-4">
          Welcome to ACAI: AI Agents Marketplace
        </h1>
        <p className="text-xl mb-8">
          Discover, interact with, and deploy powerful AI tools with ease.
        </p>
        <button className="px-6 py-3 bg-white text-blue-600 font-semibold rounded-lg hover:bg-gray-200 shadow-lg">
          Get Started
        </button>
      </section>

      {/* Features Section */}
      <section className="py-20 px-4 bg-white text-gray-800">
        <div className="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="flex flex-col items-center p-6 bg-gray-50 rounded-lg shadow-md">
            <div className="mb-4">
              <svg
                className="w-16 h-16 text-purple-600"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                viewBox="0 0 24 24"
              >
                <circle cx="12" cy="12" r="10"></circle>
                <path d="M14.31 8l5.74 9.94M9.69 8h11.5M5.05 6.05l11.9 4.9M4.22 12a9.8 9.8 0 011.82-3.865"></path>
              </svg>
            </div>
            <h3 className="text-xl font-semibold mb-2">Diverse Agent Selection</h3>
            <p className="text-center">
              Choose from an expansive list of AI agents specialized in various
              domains, from analytics to creative writing.
            </p>
          </div>
          <div className="flex flex-col items-center p-6 bg-gray-50 rounded-lg shadow-md">
            <div className="mb-4">
              <svg
                className="w-16 h-16 text-purple-600"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                viewBox="0 0 24 24"
              >
                <path d="M12 21v-2M9 17H7a5 5 0 000 10h10a5 5 0 000-10h-2"></path>
                <path d="M16 5l-4 4-4-4"></path>
              </svg>
            </div>
            <h3 className="text-xl font-semibold mb-2">Integrate Seamlessly</h3>
            <p className="text-center">
              Easy integration with your applications using API access, ensuring
              seamless operation and downtime minimization.
            </p>
          </div>
          <div className="flex flex-col items-center p-6 bg-gray-50 rounded-lg shadow-md">
            <div className="mb-4">
              <svg
                className="w-16 h-16 text-purple-600"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                viewBox="0 0 24 24"
              >
                <path d="M23 3a10.9 10.9 0 01-3.14 1.54A4.48 4.48 0 0022.43 1a10 10 0 01-3.24 1.22A4.48 4.48 0 0016.67 0C14.64 0 13 1.64 13 3.67v.67A10.66 10.66 0 012 3.13 4.5 4.5 0 003.75 9.53a4.59 4.59 0 01-2.03-.56v.06c0 2.35 1.67 4.3 3.92 4.74a4.15 4.15 0 01-2 .07c.57 1.79 2.23 3.08 4.27 3.11A9 9 0 011 18v1c2.14 1.39 4.69 2.16 7.29 2.18 8.69 0 13.44-7.37 13.44-13.77V7.82A9.41 9.41 0 0023 3z"></path>
              </svg>
            </div>
            <h3 className="text-xl font-semibold mb-2">Real-time Updates</h3>
            <p className="text-center">
              Benefit from live updates and real-time data to maintain a
              competitive edge in your operations.
            </p>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section className="flex flex-col items-center justify-center py-20 bg-gradient-to-r from-purple-600 to-blue-400 text-white">
        <h2 className="text-3xl font-bold mb-4">Ready to Start?</h2>
        <p className="text-lg mb-8">
          Join us today and transform the way you interact with AI.
        </p>
        <button className="px-8 py-4 bg-white text-purple-600 font-bold rounded-full shadow-lg hover:bg-gray-200">
          Create Your Account
        </button>
      </section>
    </div>
  );
}