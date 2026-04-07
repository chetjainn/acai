export default function LandingPage() {
  return (
    <div className="bg-white">
      {/* Hero Section */}
      <section className="bg-blue-600 text-white py-20">
        <div className="max-w-7xl mx-auto px-6 flex flex-col items-center text-center">
          <h1 className="text-5xl font-bold mb-4">Welcome to ACAI</h1>
          <p className="text-xl mb-6">
            Your one-stop marketplace for AI agents, where innovation meets ease.
          </p>
          <button className="bg-white text-blue-600 py-3 px-6 rounded-lg shadow-lg font-medium">
            Explore Now
          </button>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto px-6">
          <h2 className="text-3xl font-bold text-center text-blue-600 mb-12">
            Features
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="bg-white p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-bold mb-4">AI Agent Directory</h3>
              <p>
                Explore a wide variety of AI agents designed to simplify your
                workflows and improve efficiency.
              </p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-bold mb-4">User Dashboard</h3>
              <p>
                Manage your preferences and AI agents effortlessly from a
                centralized and intuitive dashboard.
              </p>
            </div>
            <div className="bg-white p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-bold mb-4">Secure & Scalable</h3>
              <p>
                Built with Next.js and Supabase, ensuring security and
                scalability for all your AI needs.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section className="bg-blue-600 text-white py-20">
        <div className="max-w-7xl mx-auto px-6 flex flex-col items-center text-center">
          <h2 className="text-3xl font-bold mb-4">Get Started with ACAI Today</h2>
          <p className="text-xl mb-6">
            Join our platform and revolutionize the way you interact with AI.
          </p>
          <button className="bg-white text-blue-600 py-3 px-6 rounded-lg shadow-lg font-medium">
            Sign Up Now
          </button>
        </div>
      </section>
    </div>
  );
}