export default function LandingPage() {
  return (
    <div className="bg-gray-100">
      {/* Hero Section */}
      <section className="relative w-full h-full bg-cover bg-center" style={{ backgroundImage: "url('/hero-image.jpg')" }}>
        <div className="flex items-center justify-center h-full bg-black bg-opacity-50">
          <div className="text-center text-white">
            <h1 className="text-4xl md:text-6xl font-bold mb-4">Discover the Future of AI Agents</h1>
            <p className="text-md md:text-lg mb-8">Explore, Compare, and Deploy AI Solutions Effortlessly</p>
            <a href="#features" className="px-6 py-3 bg-blue-500 hover:bg-blue-600 rounded-md text-white font-semibold">
              Learn More
            </a>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-16">
        <div className="container mx-auto px-8">
          <h2 className="text-3xl font-semibold text-center mb-12">Exclusive Features</h2>
          <div className="flex flex-wrap -mx-4">
            <div className="w-full md:w-1/3 px-4 mb-8 md:mb-0">
              <div className="p-6 bg-white shadow-md rounded-lg text-center">
                <h3 className="text-xl font-semibold mb-4">Comprehensive Directory</h3>
                <p>Quickly find agents suited to your needs from a vast library of AI solutions.</p>
              </div>
            </div>
            <div className="w-full md:w-1/3 px-4 mb-8 md:mb-0">
              <div className="p-6 bg-white shadow-md rounded-lg text-center">
                <h3 className="text-xl font-semibold mb-4">Seamless Deployment</h3>
                <p>Deploy AI agents to your environment with just a few clicks, minimizing downtimes.</p>
              </div>
            </div>
            <div className="w-full md:w-1/3 px-4">
              <div className="p-6 bg-white shadow-md rounded-lg text-center">
                <h3 className="text-xl font-semibold mb-4">Real-time Evaluation</h3>
                <p>Get in-depth analytics and performance reports on the agents you use.</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action Section */}
      <section className="bg-blue-600 py-16">
        <div className="container mx-auto px-8 text-white text-center">
          <h2 className="text-3xl font-semibold mb-4">Join the Revolution in AI</h2>
          <p className="mb-8">Sign up now to start exploring the possibilities of AI agents.</p>
          <a href="#signup" className="px-8 py-4 bg-white text-blue-600 rounded-md font-semibold">
            Get Started
          </a>
        </div>
      </section>
    </div>
  );
}