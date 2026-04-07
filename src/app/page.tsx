import React from 'react';

export default function LandingPage() {
  return (
    <div className="bg-gray-50 min-h-screen">
      {/* Hero Section */}
      <section className="bg-white">
        <div className="max-w-6xl mx-auto px-5 py-24 flex flex-col items-center">
          <h1 className="text-4xl font-bold text-gray-900 text-center">
            Empower Your Solutions with AI Agents
          </h1>
          <p className="mt-4 text-lg text-gray-600 text-center max-w-xl">
            Discover, integrate, and interact with AI agents tailored for your needs. Join the future of intelligent technology with ACAI Marketplace.
          </p>
          <div className="mt-6">
            <a href="#get-started" className="px-6 py-2 font-semibold text-white bg-blue-600 rounded-lg hover:bg-blue-700">
              Get Started
            </a>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16">
        <div className="max-w-6xl mx-auto px-5">
          <div className="flex flex-col md:flex-row md:space-x-8">
            <div className="flex-1 mb-8 md:mb-0">
              <h2 className="text-3xl font-bold text-gray-900">
                Why Choose ACAI?
              </h2>
              <p className="mt-4 text-gray-600">
                Our platform offers a diverse marketplace, robust features, and seamless integration, making it the ideal choice for innovators.
              </p>
            </div>
            <div className="flex-1 grid grid-cols-1 sm:grid-cols-2 gap-6">
              <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="font-semibold text-gray-800">Diverse Agent Solutions</h3>
                <p className="text-gray-600 mt-2">
                  Access a wide range of AI agents to solve complex problems across industries.
                </p>
              </div>
              <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="font-semibold text-gray-800">Seamless Integration</h3>
                <p className="text-gray-600 mt-2">
                  Easily integrate AI agents with your existing workflows and systems.
                </p>
              </div>
              <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="font-semibold text-gray-800">Scalable Infrastructure</h3>
                <p className="text-gray-600 mt-2">
                  Built on a robust infrastructure, ensuring reliability and scalability.
                </p>
              </div>
              <div className="bg-white p-6 rounded-lg shadow-md">
                <h3 className="font-semibold text-gray-800">Real-Time Interactions</h3>
                <p className="text-gray-600 mt-2">
                  Experience real-time interactions with AI agents for immediate insights.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section id="get-started" className="bg-blue-600 text-white py-16">
        <div className="max-w-6xl mx-auto px-5 text-center">
          <h2 className="text-3xl font-bold">Ready to Innovate?</h2>
          <p className="mt-4 text-lg">
            Join our community of forward-thinking innovators and start implementing AI solutions today.
          </p>
          <div className="mt-6">
            <a href="/signup" className="px-8 py-3 font-semibold bg-white text-blue-600 rounded-lg hover:bg-gray-100">
              Sign Up Now
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}