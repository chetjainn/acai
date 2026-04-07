export default function LandingPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="relative bg-blue-600">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24">
          <div className="flex flex-col items-center text-center">
            <h1 className="text-4xl font-bold text-white sm:text-5xl">
              Discover Intelligent AI Agents
            </h1>
            <p className="mt-4 text-lg text-blue-200">
              Unlock the potential of AI with ACAI - your marketplace for AI agents.
            </p>
            <button className="mt-6 px-8 py-3 bg-white text-blue-600 font-medium rounded hover:bg-gray-100">
              Get Started
            </button>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="flex flex-col items-center p-6 bg-white shadow-md rounded-lg">
              <img src="/feature1.png" alt="Feature 1" className="w-20 h-20 mb-4" />
              <h3 className="text-xl font-semibold">Diverse AI Models</h3>
              <p className="mt-2 text-center text-gray-600">
                Access a variety of AI models tailored for different tasks.
              </p>
            </div>
            <div className="flex flex-col items-center p-6 bg-white shadow-md rounded-lg">
              <img src="/feature2.png" alt="Feature 2" className="w-20 h-20 mb-4" />
              <h3 className="text-xl font-semibold">User-Friendly Interface</h3>
              <p className="mt-2 text-center text-gray-600">
                Easily find and interact with AI agents through an intuitive UI.
              </p>
            </div>
            <div className="flex flex-col items-center p-6 bg-white shadow-md rounded-lg">
              <img src="/feature3.png" alt="Feature 3" className="w-20 h-20 mb-4" />
              <h3 className="text-xl font-semibold">Secure and Reliable</h3>
              <p className="mt-2 text-center text-gray-600">
                Experience a secure environment with top-notch data protection.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section className="bg-blue-600 py-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl font-bold text-white">
            Ready to Revolutionize Your Workflow with AI Agents?
          </h2>
          <p className="mt-4 text-lg text-blue-200">
            Sign up today and start exploring the possibilities with ACAI.
          </p>
          <button className="mt-8 px-8 py-3 bg-white text-blue-600 font-medium rounded hover:bg-gray-100">
            Join Now
          </button>
        </div>
      </section>
    </div>
  );
}