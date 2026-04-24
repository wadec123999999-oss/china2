import { describe, expect, it } from "vitest";

import { centsFromUsd, splitFee, usd } from "@/lib/money";

describe("money utilities", () => {
  it("formats integer cents as USD", () => {
    expect(usd(12345)).toBe("$123.45");
  });

  it("converts usd decimals to integer cents", () => {
    expect(centsFromUsd(123.45)).toBe(12345);
  });

  it("splits fees using banker rounding and keeps totals balanced", () => {
    expect(splitFee(101)).toEqual({
      totalCents: 101,
      platformCents: 25,
      expertCents: 76,
    });

    expect(splitFee(102)).toEqual({
      totalCents: 102,
      platformCents: 26,
      expertCents: 76,
    });
  });
});
