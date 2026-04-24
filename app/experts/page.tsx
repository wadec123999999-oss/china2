import Image from "next/image";
import Link from "next/link";

const citySections = [
  {
    slug: "beijing",
    name: "Beijing",
    image:
      "https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Imperial layers",
    description:
      "Hutongs, court ritual, old stone, and a slower reading of power, memory, and everyday northern life.",
  },
  {
    slug: "chengdu",
    name: "Chengdu",
    image:
      "https://images.unsplash.com/photo-1518684079-3c830dcef090?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Tea & local ease",
    description:
      "Tea houses, Sichuan kitchens, neighborhood rhythm, and a city that knows how to linger beautifully.",
  },
  {
    slug: "chongqing",
    name: "Chongqing",
    image:
      "https://images.unsplash.com/photo-1514565131-fce0801e5785?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Vertical drama",
    description:
      "River cliffs, layered roads, neon nights, and a cinematic urban landscape full of texture and appetite.",
  },
  {
    slug: "jingdezhen",
    name: "Jingdezhen",
    image:
      "https://images.unsplash.com/photo-1518391846015-55a9cc003b25?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Porcelain capital",
    description:
      "Kilns, studios, material knowledge, and centuries of ceramic craft still alive in daily practice.",
  },
  {
    slug: "quanzhou",
    name: "Quanzhou",
    image:
      "https://images.unsplash.com/photo-1528164344705-47542687000d?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Maritime memory",
    description:
      "Temples, trade routes, layered faiths, and one of the richest port-city histories in China.",
  },
  {
    slug: "jingmai-mountain",
    name: "Jingmai Mountain",
    image:
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Tea mountains",
    description:
      "Mist, ancient tea forests, terrace light, and a deep sense of mountain time and quiet.",
  },
  {
    slug: "wudang-mountain",
    name: "Wudang Mountain",
    image:
      "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1600&q=80",
    eyebrow: "Taoist stillness",
    description:
      "Cloud temples, internal martial arts, mountain paths, and an atmosphere shaped by contemplation.",
  },
] as const;

export default function ExpertsPage() {
  return (
    <main className="min-h-screen bg-[#1a1412] px-6 py-12 text-[#f5ede5]">
      <div className="mx-auto max-w-7xl">
        <section className="overflow-hidden rounded-[2rem] border border-[#3c2b24] bg-[linear-gradient(135deg,#241916,#1b1412)] p-8 shadow-[0_30px_80px_-42px_rgba(0,0,0,0.65)] sm:p-10">
          <p className="text-sm uppercase tracking-[0.24em] text-[#c8a78b]">
            City collection
          </p>
          <h1 className="mt-4 font-serif text-4xl leading-tight text-[#f8efe6] sm:text-5xl lg:text-6xl">
            Seven cities, seven different ways into China.
          </h1>
          <p className="mt-4 max-w-3xl text-sm leading-7 text-[#baa39a] sm:text-base">
            Each city opens a different texture of travel: craft, tea, food,
            ritual, mountain stillness, port history, or dense urban energy.
            Choose a city to enter its own page.
          </p>
        </section>

        <section className="mt-8 grid gap-6 lg:grid-cols-2">
          {citySections.map((city) => (
            <Link
              key={city.slug}
              href={`/city/${city.slug}`}
              className="group overflow-hidden rounded-[2rem] border border-[#3a2a23] bg-[#221916] shadow-[0_24px_60px_-42px_rgba(0,0,0,0.6)] transition duration-300 hover:-translate-y-1 hover:border-[#5a4034]"
            >
              <div className="relative h-72 overflow-hidden">
                <Image
                  alt={city.name}
                  className="object-cover transition duration-700 group-hover:scale-[1.04]"
                  fill
                  sizes="(max-width: 1024px) 100vw, 50vw"
                  src={city.image}
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#120d0c] via-[#120d0c]/35 to-transparent" />
              </div>

              <div className="space-y-4 p-6 sm:p-7">
                <p className="text-xs uppercase tracking-[0.24em] text-[#c8a78b]">
                  {city.eyebrow}
                </p>
                <div className="flex items-end justify-between gap-4">
                  <h2 className="font-serif text-3xl text-[#f8efe6] sm:text-[2rem]">
                    {city.name}
                  </h2>
                  <span className="text-sm text-[#d8bba8] transition group-hover:translate-x-1">
                    Enter →
                  </span>
                </div>
                <p className="text-sm leading-7 text-[#cbb4a8] sm:text-[1rem]">
                  {city.description}
                </p>
              </div>
            </Link>
          ))}
        </section>
      </div>
    </main>
  );
}
