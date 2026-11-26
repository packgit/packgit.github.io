import '../models/strategy.dart';

const _adapty = (
  'Adapty',
  'https://adapty.io/blog/how-to-increase-app-downloads/',
);
const _branch = (
  'Branch',
  'https://www.branch.io/resources/blog/9-tactics-to-increase-app-downloads-for-less/',
);
const _entrepreneur = (
  'Entrepreneur',
  'https://www.entrepreneur.com/growing-a-business/5-growth-hacking-strategies-to-increase-your-app-downloads/269497',
);
const _inbeat = ('Inbeat', 'https://inbeat.agency/blog/increase-app-downloads');
const _appsflyer = (
  'AppsFlyer',
  'https://www.appsflyer.com/blog/tips-strategy/increase-app-downloads/',
);
const _expo = (
  'Expo',
  'https://expo.dev/blog/how-to-increase-mobile-app-downloads-and-retention',
);
const _mobileAction = (
  'MobileAction',
  'https://www.mobileaction.co/guide/the-definitive-guide-for-mobile-user-acquisition/',
);
const _adjust = (
  'Adjust',
  'https://www.adjust.com/resources/guides/user-acquisition/',
);
const _growthMetric = (
  'The Growth Metric',
  'https://www.thegrowthmetric.com/7-app-growth-hacking-strategies/',
);
const _revenueCat = (
  'RevenueCat',
  'https://www.revenuecat.com/blog/growth/grow-your-app-with-revenuecat-an-intro-for-app-marketers',
);

Strategy _s(
  int n,
  int effort,
  String title,
  String first,
  String second,
  (String, String) source,
) {
  return Strategy(
    id: 'strategy-$n',
    title: title,
    description: '$first $second',
    effort: effort,
    sourceLabel: source.$1,
    url: source.$2,
  );
}

/// The curated checklist, ordered from easiest to hardest by [Strategy.effort].
/// Every description is two sentences of ten words each (enforced by
/// `test/strategies_test.dart`).
final List<Strategy> strategies = List.unmodifiable([
  _s(
    1,
    2,
    'Optimize Your App Store Title',
    'Place your primary keyword inside the title users actually search.',
    'Keep it under thirty characters so listings never get truncated.',
    _adapty,
  ),
  _s(
    6,
    2,
    'Write a Persuasive Description',
    'Open with a clear benefit statement before listing any features.',
    'Use short paragraphs and bullet points for easy mobile skimming.',
    _adapty,
  ),
  _s(
    2,
    3,
    'Research High-Intent Keywords',
    'Study competitor listings to discover search terms with strong intent.',
    'Refresh your keyword list monthly using ranking and volume data.',
    _mobileAction,
  ),
  _s(
    8,
    3,
    'Collect Ratings and Reviews',
    'Prompt happy users for a rating after a successful moment.',
    'Reply to every review publicly to show that you listen.',
    _expo,
  ),
  _s(
    15,
    3,
    'Bid in Apple Search Ads',
    'Bid on your brand and competitor keywords right at launch.',
    'Shift budget toward groups delivering the lowest cost per install.',
    _mobileAction,
  ),
  _s(
    30,
    3,
    'Apply for Store Featuring',
    "Submit your app for editorial consideration using each store's form.",
    'Highlight seasonal themes, new features, and genuinely polished design details.',
    _inbeat,
  ),
  _s(
    13,
    4,
    'Add QR Codes to Offline Media',
    'Print scannable codes on packaging, posters, receipts, and event signage.',
    'Track every code with unique parameters to measure offline impact.',
    _branch,
  ),
  _s(
    17,
    4,
    'Partner with Micro Influencers',
    'Choose micro creators whose followers closely match your target users.',
    'Give each creator a unique link to compare campaign results.',
    _inbeat,
  ),
  _s(
    18,
    4,
    'Cross-Promote Your Other Apps',
    'Feature your other apps inside screens where users feel satisfied.',
    'Swap promotions with friendly developers who share a compatible audience.',
    _appsflyer,
  ),
  _s(
    20,
    4,
    'Build a Pre-Launch Waitlist',
    'Collect emails on a teaser page several weeks before launch.',
    'Notify subscribers on release day with a direct download link.',
    _entrepreneur,
  ),
  _s(
    21,
    4,
    'Pitch Journalists and Bloggers',
    'Craft a concise pitch highlighting the problem your app solves.',
    'Send personalized emails to journalists covering your specific app category.',
    _entrepreneur,
  ),
  _s(
    3,
    5,
    'Design a Memorable App Icon',
    'Choose a bold, simple symbol that stands out in results.',
    'Test icon variants with store experiments and keep the winner.',
    _adapty,
  ),
  _s(
    4,
    5,
    'Craft Conversion-Focused Screenshots',
    'Lead with your strongest benefit in the first two screenshots.',
    'Add short captions so scrolling visitors understand value within seconds.',
    _adapty,
  ),
  _s(
    16,
    5,
    'Scale with Google App Campaigns',
    'Provide varied headlines, images, and videos for automated ad optimization.',
    'Set install goals first, then graduate toward in-app event goals.',
    _mobileAction,
  ),
  _s(
    22,
    5,
    'Launch on Product Hunt',
    'Prepare visual assets, a tagline, and supporters before launch morning.',
    'Respond to every comment quickly to keep momentum all day.',
    _growthMetric,
  ),
  _s(
    7,
    6,
    'Localize Your Store Listing',
    'Translate titles and screenshots for your top five growth markets.',
    'Adapt idioms and imagery so content feels native to locals.',
    _appsflyer,
  ),
  _s(
    9,
    6,
    'Run Store Listing Experiments',
    'Test one element at a time to learn what converts.',
    'Roll out winning variants to everyone once results reach significance.',
    _adapty,
  ),
  _s(
    12,
    6,
    'Build a Smart Landing Page',
    'Build a fast mobile-friendly page with one clear download button.',
    "Detect the visitor's device and route them to their store.",
    _branch,
  ),
  _s(
    14,
    6,
    'Run Paid Social Campaigns',
    'Launch short vertical videos on platforms where your audience scrolls.',
    'Refresh creatives weekly to prevent fatigue and rising acquisition costs.',
    _adjust,
  ),
  _s(
    19,
    6,
    'Publish Helpful Content Marketing',
    'Publish helpful guides that solve problems your future users have.',
    'Link each article to a relevant download call to action.',
    _inbeat,
  ),
  _s(
    25,
    6,
    'Use Smart Push Notifications',
    'Send timely, personalized notifications that remind users why they installed.',
    'Limit frequency and honor preferences to avoid uninstalls and churn.',
    _expo,
  ),
  _s(
    29,
    6,
    'Ship Regular App Updates',
    'Ship regular updates and mention improvements in the release notes.',
    'Fresh updates signal active development and improve store ranking signals.',
    _revenueCat,
  ),
  _s(
    5,
    7,
    'Publish a Compelling Preview Video',
    'Show your core experience within the first five seconds clearly.',
    'Add captions because most people watch previews with sound off.',
    _appsflyer,
  ),
  _s(
    11,
    7,
    'Use Deep Links Everywhere',
    'Send ad clicks straight to the exact in-app content promised.',
    'Deferred deep linking preserves context even when installs happen first.',
    _branch,
  ),
  _s(
    23,
    7,
    'Grow an Engaged Community',
    'Host a Discord or Slack group for your engaged users.',
    'Invite members to test features early and share honest feedback.',
    _revenueCat,
  ),
  _s(
    28,
    7,
    'Target Lookalike and Retargeting Audiences',
    'Build lookalike audiences from your highest-value users for efficient reach.',
    "Retarget website visitors who haven't installed yet with tailored reminders.",
    _adjust,
  ),
  _s(
    10,
    8,
    'Launch Referral Rewards',
    'Offer both inviter and friend a reward worth claiming immediately.',
    'Place the invite button right after users hit a milestone.',
    _growthMetric,
  ),
  _s(
    24,
    8,
    'Streamline Your Onboarding',
    'Reduce signup friction by letting people explore before creating accounts.',
    'Show value within sixty seconds to turn installers into regulars.',
    _expo,
  ),
  _s(
    27,
    8,
    'Measure Attribution by Channel',
    'Use a mobile measurement partner to attribute installs to channels.',
    'Cut underperforming sources quickly and double down on profitable ones.',
    _adjust,
  ),
  _s(
    26,
    10,
    'Offer Instant Try-Before-Install Experiences',
    'Offer lightweight instant experiences that let people try before installing.',
    'Prompt the full install once users experience genuine value firsthand.',
    _branch,
  ),
]);
