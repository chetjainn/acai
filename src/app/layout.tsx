import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = { title: "ACAI", description: "Built by One Machine AI Accelerator" };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <html lang="en"><body className="bg-white text-gray-900 min-h-screen antialiased">{children}</body></html>;
}
