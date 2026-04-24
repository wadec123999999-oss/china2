import { PLATFORM_FEE_PCT } from "@/lib/constants";

const USD_FORMATTER = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

export function usd(cents: number): string {
  assertIntegerCents(cents);
  return USD_FORMATTER.format(cents / 100);
}

export function centsFromUsd(value: number): number {
  if (!Number.isFinite(value)) {
    throw new Error("Amount must be a finite number.");
  }

  return Math.round((value + Number.EPSILON) * 100);
}

export function splitFee(totalCents: number): {
  totalCents: number;
  platformCents: number;
  expertCents: number;
} {
  assertIntegerCents(totalCents);

  const exactPlatformFee = (totalCents * PLATFORM_FEE_PCT) / 100;
  const roundedPlatformFee = roundHalfToEven(exactPlatformFee);
  const expertCents = totalCents - roundedPlatformFee;

  return {
    totalCents,
    platformCents: roundedPlatformFee,
    expertCents,
  };
}

function assertIntegerCents(value: number): void {
  if (!Number.isInteger(value)) {
    throw new Error("Money values must be stored as integer cents.");
  }
}

function roundHalfToEven(value: number): number {
  const floor = Math.floor(value);
  const diff = value - floor;

  if (diff < 0.5) {
    return floor;
  }

  if (diff > 0.5) {
    return floor + 1;
  }

  return floor % 2 === 0 ? floor : floor + 1;
}
