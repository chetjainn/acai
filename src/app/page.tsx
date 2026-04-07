function LandingPage() {
  return (
    <div className="min-h-screen bg-gray-100">
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-blue-500 to-teal-500 text-white py-20">
        <div className="container mx-auto px-6 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            Accelerate AI Adoption with ACAI
          </h1>
          <p className="mb-6 text-lg md:text-xl">
            Discover, compare, and deploy AI agents effortlessly.
          </p>
          <a
            href="#features"
            className="bg-white text-blue-500 font-semibold px-6 py-3 rounded-lg shadow-md hover:bg-blue-50 transition"
          >
            Explore Now
          </a>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-16 bg-white">
        <div className="container mx-auto px-6">
          <h2 className="text-3xl font-bold text-center mb-6">Platform Features</h2>
          <div className="grid md:grid-cols-3 gap-6">
            <div className="bg-gray-50 p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-semibold mb-2">Discover AI Agents</h3>
              <p>
                Browse a curated marketplace of AI-driven solutions tailored to
                your needs.
              </p>
            </div>
            <div className="bg-gray-50 p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-semibold mb-2">Comprehensive Comparisons</h3>
              <p>
                Easily compare agents to find the perfect fit with detailed
                breakdowns.
              </p>
            </div>
            <div className="bg-gray-50 p-6 rounded-lg shadow-md">
              <h3 className="text-2xl font-semibold mb-2">Seamless Deployment</h3>
              <p>
                Simplify integration and deployment with step-by-step
                instructions and support.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="bg-blue-500 text-white py-16">
        <div className="container mx-auto px-6 text-center">
          <h2 className="text-4xl font-bold mb-3">Get Started with ACAI Today</h2>
          <p className="mb-6 text-lg">
            Sign up now to begin your journey in exploring and deploying the
            most advanced AI agents.
          </p>
          <a
            href="/signup"
            className="bg-white text-blue-500 font-bold px-8 py-4 rounded-lg shadow-lg hover:bg-blue-50 transition"
          >
            Sign Up
          </a>
        </div>
      </section>
    </div>
  );
}

export default LandingPage;