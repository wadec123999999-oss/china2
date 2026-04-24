export const en = {
  site: {
    name: "A Deeper China",
    eyebrow: "China, Closely",
    tagline: "China, Closely: See the unseen.",
  },
  navigation: {
    home: "Home",
    chat: "Chat",
    experts: "Experts",
    account: "Account",
  },
  landing: {
    cta: "Start your match",
    trustBar:
      "Vetted local experts. Thoughtful cultural experiences. Secure booking.",
  },
  booking: {
    confirm: "Confirm booking",
    paymentSuccess: "Paid—see you there",
  },
} as const;

export type Messages = typeof en;
