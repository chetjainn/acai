export default function LandingPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-blue-600 text-white py-20">
        <div className="container mx-auto text-center">
          <h1 className="text-4xl md:text-6xl font-bold">
            Welcome to ACAI - Your AI Agents Marketplace
          </h1>
          <p className="mt-5 text-lg md:text-xl">
            Discover, compare, and deploy AI agents effortlessly.
          </p>
          <div className="mt-8">
            <a
              href="#"
              className="inline-block bg-white text-blue-600 px-8 py-3 rounded-full font-semibold hover:text-blue-700"
            >
              Get Started
            </a>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-16">
        <div className="container mx-auto px-6 md:px-12">
          <h2 className="text-3xl md:text-4xl font-bold text-center text-gray-800">
            Why Choose ACAI?
          </h2>
          <div className="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="bg-white shadow-md rounded-lg p-6">
                <div className="mb-4">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-12 w-12 mx-auto text-blue-600"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth={2}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M12 8c1.104 0 2 .896 2 2s-.896 2-2 2-2-.896-2-2 .896-2 2-2zm0 4c.552 0 1-.448 1-1s-.448-1-1-1-1 .448-1 1 .448 1 1 1zm6-9a2 2 0 012 2v14a2 2 0 01-2 2H6a2 2 0 01-2-2V5a2 2 0 012-2h12zm0 2H6v14h12V5z"
                    />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-gray-800">
                  Vast Agent Library
                </h3>
                <p className="mt-2 text-gray-600">
                  Access a diverse collection of AI agents ready to be deployed
                  for your projects.
                </p>
              </div>
            </div>
            <div className="text-center">
              <div className="bg-white shadow-md rounded-lg p-6">
                <div className="mb-4">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-12 w-12 mx-auto text-blue-600"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth={2}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M3 7h5V4h8v3h5M4 11V7h16v4M4 11l-.4 1.634a2 2 0 001.58 2.324L8 16l2 3h4l2-3 2.82-.326a2 2 0 001.18-.788L20 11z"
                    />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-gray-800">
                  Easy Deployment
                </h3>
                <p className="mt-2 text-gray-600">
                  Deploy AI agents with just a few clicks, no hassle required.
                </p>
              </div>
            </div>
            <div className="text-center">
              <div className="bg-white shadow-md rounded-lg p-6">
                <div className="mb-4">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-12 w-12 mx-auto text-blue-600"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth={2}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M12 8c1.104 0 2 .896 2 2s-.896 2-2 2-2-.896-2-2 .896-2 2-2zM6 8a6 6 0 1111.84 1.158C17.666 10.448 17 13.372 17 16c0 1.105.895 2 2 2s2-.895 2-2c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 1.105.895 2 2 2s2-.895 2-2c0-6.627 5.373-12 12-12z"
                    />
                  </svg>
                </div>
                <h3 className="text-xl font-semibold text-gray-800">
                  Seamless Integration
                </h3>
                <p className="mt-2 text-gray-600">
                  Easily integrate agents into your existing workflows.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="bg-blue-600 text-white py-20">
        <div className="container mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold">
            Ready to Transform Your Business with AI?
          </h2>
          <p className="mt-4 text-lg md:text-xl">
            Join ACAI today and start leveraging the power of AI agents.
          </p>
          <div className="mt-8">
            <a
              href="#"
              className="inline-block bg-white text-blue-600 px-8 py-3 rounded-full font-semibold hover:text-blue-700"
            >
              Sign Up Now
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}