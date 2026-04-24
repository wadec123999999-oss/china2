import Link from "next/link";

import { en } from "@/lib/i18n/en";

const navItems = [
  { href: "/", label: en.navigation.home },
  { href: "/chat", label: en.navigation.chat },
  { href: "/destinations", label: "Destinations" },
  { href: "/experts", label: en.navigation.experts },
  { href: "/account", label: en.navigation.account },
];

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-20 border-b border-white/14 bg-[#fff8f7]/12 backdrop-blur-2xl">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-5">
        <Link className="flex leading-none" href="/">
          <span className="text-[20px] font-semibold tracking-tight text-white sm:text-[24px]">
            China, Closely: See the unseen.
          </span>
        </Link>
        <nav className="flex items-center gap-6 text-base font-semibold text-white sm:gap-8 sm:text-lg">
          {navItems.map((item) => (
            <Link
              key={item.href}
              className="transition hover:text-white/78"
              href={item.href}
            >
              {item.label}
            </Link>
          ))}
        </nav>
      </div>
    </header>
  );
}
