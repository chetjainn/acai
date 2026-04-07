export default function Home() {
  return <div>default function LandingPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-white py-20">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-4xl font-bold text-gray-800 mb-4">
            Discover and Deploy AI Agents Effortlessly
          </h1>
          <p className="text-gray-600 mb-8">
            ACAI is your marketplace for finding, comparing, and deploying cutting-edge AI agents.
          </p>
          <a
            href="#features"
            className="bg-blue-600 text-white rounded-full px-8 py-3 inline-block hover:bg-blue-500"
          >
            Explore Features
          </a>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-20 bg-gray-200">
        <div className="container mx-auto px-6">
          <h2 className="text-3xl font-bold text-center text-gray-800 mb-10">
            Outstanding Features
          </h2>
          <div className="grid lg:grid-cols-3 gap-8">
            <div className="bg-white rounded shadow p-6">
              <h3 className="text-xl font-semibold text-gray-800 mb-4">Agent Directory</h3>
              <p className="text-gray-600">
                Easily browse and filter AI agents tailored to your needs.
              </p>
            </div>
            <div className="bg-white rounded shadow p-6">
              <h3 className="text-xl font-semibold text-gray-800 mb-4">User Dashboard</h3>
              <p className="text-gray-600">
                Manage your accounts and track agent deployments efficiently.
              </p>
            </div>
            <div className="bg-white rounded shadow p-6">
              <h3 className="text-xl font-semibold text-gray-800 mb-4">Seamless Integration</h3>
              <p className="text-gray-600">
                Integrate ACAI effortlessly into your existing workflows.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section className="bg-white py-20">
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-3xl font-bold text-gray-800 mb-4">
            Ready to Transform Your Business with AI?
          </h2>
          <p className="text-gray-600 mb-8">
            Join us today and get started with deploying AI agents that align with your goals.
          </p>
          <a 
            href="/signup" 
            className="bg-blue-600 text-white rounded-full px-8 py-3 inline-block hover:bg-blue-500"
          >
            Get Started
          </a>
        </div>
      </section>
    </div>
  );
}</div>;
}