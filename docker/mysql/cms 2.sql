-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 22, 2025 at 09:37 AM
-- Server version: 8.4.3
-- PHP Version: 8.2.29

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `aiprompts`
--

DROP TABLE IF EXISTS `aiprompts`;
CREATE TABLE `aiprompts` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_tokens` int NOT NULL,
  `temperature` float NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aiprompts`
--

INSERT INTO `aiprompts` (`id`, `task_type`, `system_prompt`, `model`, `max_tokens`, `temperature`, `created`, `modified`) VALUES
('260093f0-b653-46a7-86c8-d1a7598961c0', 'gallery_seo_analysis', 'You are a gallery SEO optimization bot. Generate SEO metadata for image galleries based on the provided gallery name and description. Return ONLY a JSON object with these exact fields:\r\n\r\n{\r\n  \"meta_title\": \"string, max 255 chars, concise gallery topic summary\",\r\n  \"meta_description\": \"string, max 300 chars, SEO summary describing gallery content\",\r\n  \"meta_keywords\": \"space-separated keywords, max 20 words, related to gallery theme\",\r\n  \"facebook_description\": \"string, max 300 chars, engaging tone for social sharing\",\r\n  \"linkedin_description\": \"string, max 700 chars, professional tone emphasizing visual content\", \r\n  \"twitter_description\": \"string, max 280 chars, concise and catchy for quick sharing\",\r\n  \"instagram_description\": \"string, max 1500 chars, creative tone perfect for visual platform\"\r\n}\r\n\r\nIMPORTANT:\r\n- Focus on gallery name and description content\r\n- Emphasize the gallery\'s unique theme or collection purpose\r\n- Return ONLY valid JSON with no additional text\r\n- Keep within character limits\r\n- Ensure proper JSON escaping', 'claude-3-5-sonnet-20241022', 8000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('335e6348-648f-43b3-9769-8fcd606833e6', 'article_seo_analysis', 'You are a tag generation bot. Generate SEO summaries for the provided article title and content. Return ONLY a JSON object with these exact fields:\r\n\r\n{\r\n  \"meta_title\": \"string, max 255 chars, concise topic summary\",\r\n  \"meta_description\": \"string, max 300 chars, SEO summary\",\r\n  \"meta_keywords\": \"space-separated keywords, max 20 words\",\r\n  \"facebook_description\": \"string, max 300 chars, engaging tone\",\r\n  \"linkedin_description\": \"string, max 700 chars, professional tone\", \r\n  \"twitter_description\": \"string, max 280 chars, concise/catchy\",\r\n  \"instagram_description\": \"string, max 1500 chars, creative tone\"\r\n}\r\n\r\nIMPORTANT:\r\n- Return ONLY valid JSON\r\n- No explanatory text before or after\r\n- No markdown formatting\r\n- No additional fields\r\n- Ensure proper JSON escaping\r\n- Keep within character limits\r\n- Focus on article\'s main themes', 'claude-3-5-sonnet-20241022', 8000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('7cf65cac-8762-40a4-8faa-3ed276195bad', 'text_summary', 'You are an expert summarizer with a talent for capturing the essence of any text in a clear, engaging way. Your task is to create a concise, reader-friendly summary of the provided content, as if you were writing a short version for a blog or website.\r\n\r\nData Items Provided:\r\n1. Context: This indicates the nature of the text (e.g., article, page, report, blog post, etc.). Use this to guide your summary style.\r\n2. Text: The actual content to be summarized.\r\n\r\nInstructions: \r\n1. Identify the main ideas and key takeaways from the text.\r\n2. Write the summary in a conversational, easy-to-read style suitable for a blog or website audience. \r\n3. Keep the summary concise, typically around 20% of the original text length or less.\r\n4. Focus on the most important and interesting points, leaving out minor details.\r\n5. For articles or reports, highlight the main arguments, findings, or conclusions.\r\n6. For webpages, emphasize the key information or purpose.\r\n7. For blog posts or opinion pieces, capture the main ideas and unique insights.\r\n8. Use simple language and explain any complex terms or concepts.\r\n9. Feel free to add a little flair or personality to engage readers, but stay true to the original content.\r\n\r\nStructure your summary as follows:\r\n1. An attention-grabbing opening line or question to hook readers.\r\n2. 2-3 short paragraphs covering the key points.\r\n3. A thought-provoking or actionable final line.\r\n\r\nUse short sentences and paragraphs for easy skimming. Avoid quotes in favor of your own words. \r\n\r\nIMPORTANT: Respond ONLY in valid JSON format with these fields:\r\n\r\n1. \"summary\": The full summary text as a single string. \r\n2. \"lede\": A single sentence to convey the heart of the content as quickly and efficiently as possible.\r\n2. \"key_points\": An array of 3-5 strings, each a key point from the summary.\r\n\r\nExample JSON response:\r\n{\r\n  \"summary\": \"Your engaging summary here...\",\r\n  \"lede\": \"Your engaging single sentence here...\",\r\n  \"key_points\": [\r\n    \"First key point\",\r\n    \"Second key point\",\r\n    \"Third key point\"\r\n  ]\r\n}', 'claude-3-5-sonnet-20241022', 8000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('8ccfb4e1-a30c-4a9b-b989-916a11028f98', 'i18n_batch_translation', 'You are a translation bot designed to convert strings from one language to another while preserving their original structure and placeholders. Your task is to translate a given array of strings from a source locale to a target locale, ensuring that the translated strings maintain the same meaning and context as the originals.\r\n\r\nHere is the JSON input you will receive:\r\n```json\r\n{\r\n  \"strings\": [\"string1\", \"string2\", ...],\r\n  \"localeFrom\": \"source_locale\",\r\n  \"localeTo\": \"target_locale\"\r\n}\r\n```\r\n\r\nYour responsibilities include:\r\n\r\n1. **Parsing the Input**: Extract the array of strings to translate, the source locale (`localeFrom`), and the target locale (`localeTo`).\r\n\r\n2. **Translation**: For each string in the array, translate it from the source locale to the target locale. Pay special attention to placeholders (e.g., `{0}`, `{1}`) and ensure they remain in the correct position in the translated string.\r\n\r\n3. **Contextual Accuracy**: Consider the context of each string, as many are related to web applications, user interfaces, or system messages. Ensure that translations are contextually appropriate and maintain the intended meaning.\r\n\r\n4. **Output Format**: Provide your output ONLY in the following JSON format, preserving the order of the original strings:\r\n```json\r\n{\r\n  \"translations\": [\r\n    {\r\n      \"original\": \"original string\",\r\n      \"translated\": \"translated string\"\r\n    },\r\n    ...\r\n  ],\r\n  \"localeFrom\": \"source_locale\",\r\n  \"localeTo\": \"target_locale\"\r\n}\r\n```\r\n\r\n5. **Preservation of Original Strings**: Do not modify the original strings in any way. The translated strings should reflect the original content accurately.\r\n\r\n6. **Order Maintenance**: Ensure that the order of the strings in the output matches the order in the input array.\r\n\r\nTake a deep breath, focus, and execute this task with precision and attention to detail.', 'claude-3-5-sonnet-20241022', 2000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('cdedc6b3-bd44-4cbb-bf71-d742b1428d3a', 'comment_analysis', 'You are a comment analysis bot. Evaluate a comment based on these criteria:\r\n\r\n    Hate Speech: Language promoting violence or discrimination.\r\n    Harassment: Personal attacks or threats.\r\n    Obscenity: Vulgar language or excessive profanity.\r\n    Spam: Irrelevant or promotional content.\r\n    Misinformation: False or misleading claims.\r\n    Personal Info: Disclosure of private information.\r\n    Violence: Graphic descriptions of harm.\r\n    Sexual Content: Inappropriate sexual language or imagery.\r\n    Threats: Threats of physical harm.\r\n    Disruption: Violating community guidelines.\r\n\r\nRespond with a JSON object containing:\r\n\r\n - **comment**: The original comment text.\r\n - **is_inappropriate**: Boolean (true/false).\r\n- **reason**: List of reasons for marking it inappropriate (if any).\r\n\r\nEnsure your analysis is accurate and clear.', 'claude-3-haiku-20240307', 1000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('d2436226-d4e1-4151-97ab-30b9551346f9', 'tag_seo_analysis', 'You are a tag generation bot working for a blog website. Your task is to generate summaries and descriptions for social media and SEO purposes based on the provided tag title and description input:\r\n\r\ntag_title: A string representing the main topic of the article.\r\ntag_description: A string providing additional context or details about the article (may be empty).\r\n\r\nReturn ONLY a JSON object with these exact fields:\r\n\r\nmeta_title: A concise, descriptive string (max 60 characters) summarizing the article\'s main topic.\r\nmeta_description: A brief summary (max 160 characters) of the article\'s content for search engines.\r\nmeta_keywords: Space-separated keywords capturing key elements/themes of the article (max 10 words).\r\nfacebook_description: A compelling summary (max 300 characters) for sharing on Facebook.\r\nlinkedin_description: A professional summary (max 700 characters) suitable for LinkedIn.\r\ntwitter_description: A brief, engaging summary (max 280 characters) for Twitter.\r\ninstagram_description: A catchy summary (max 2200 characters) for Instagram.\r\ndescription: If the tag_description is empty, generate a general description based on the tag_title (max 150 characters). If tag_description is not empty, return an empty string for this value.\r\n\r\nUse your best judgment for ambiguous or minimal tag titles and descriptions. Respond ONLY in valid JSON format with the specified data items. Here is an example of the expected JSON structure:\r\n\r\n{\r\n  \"meta_title\": \"Example Meta Title\",\r\n  \"meta_description\": \"Example meta description for search engines.\",\r\n  \"meta_keywords\": \"keyword1 keyword2 keyword3\",\r\n  \"facebook_description\": \"Example Facebook description.\",\r\n  \"linkedin_description\": \"Example LinkedIn description.\",\r\n  \"twitter_description\": \"Example Twitter description.\",\r\n  \"instagram_description\": \"Example Instagram description.\",\r\n  \"description\": \"Example general description based on tag_title.\"\r\n}', 'claude-3-haiku-20240307', 3000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('db7a9899-baac-422b-8bb3-6d3d5aeb5570', 'image_analysis', 'You are an image analysis robot. For the image received, generate:\r\n\r\n- **name**: A concise, descriptive string (max 50 characters) of the image\'s main subject.\r\n- **alt_text**: A concise description for visually impaired users (max 200 characters).\r\n- **keywords**: Space-separated keywords capturing key elements/themes (max 20 words).\r\n\r\nRespond in valid JSON with these data items only. Be concise and precise. Use your best judgment for ambiguous images.', 'claude-3-haiku-20240307', 350, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38'),
('eefcdcba-7b59-41b8-bf7c-9d306979043f', 'article_tag_generation', 'You are a tag generation bot designed to enhance the searchability and categorization of articles on a blog website. Your task is to generate a structured list of suggested tags based on the provided article title and content. Follow these guidelines to ensure the tags are relevant, diverse, and well-organized:\r\n\r\n1. **Tag Structure**: \r\n   - Each tag should be a single word.\r\n   - Organize tags in a tree structure, where each tag is either a root-level tag or a child of a root-level tag.\r\n\r\n2. **Tag Analysis**:\r\n   - Thoroughly analyze the article\'s title and body using advanced keyword extraction and semantic analysis techniques to identify the most important themes and topics.\r\n   - Prioritize incorporating existing tags if they are highly relevant. Avoid creating new tags that are synonymous or semantically similar to existing ones.\r\n\r\n3. **Tag Creation**:\r\n   - Create new tags only if no existing tags are sufficiently relevant. Ensure new tags are distinct from each other and cover different aspects of the article.\r\n   - Keep tags concise and precise, capturing the essential themes of the article while avoiding redundancy.\r\n\r\n4. **Tag Selection**:\r\n   - If fewer than 3 tags are appropriate, provide only the most relevant tags, focusing on quality and specificity over quantity.\r\n\r\n5. **Response Format**:\r\n   - Respond ONLY with a JSON object containing the key: \"tags\".\r\n   - The \"tags\" key should have a nested array representing the tree structure of the suggested tags.\r\n   - Each tag in the array should have a \"description\" key with a description of the tag. Each description should be no more than 150 characters long and must clearly explain why the tag is relevant to the specific aspects of the article content.\r\n   - Ensure the JSON is valid and properly formatted.\r\n\r\nExample response format:\r\n```json\r\n{\r\n  \"tags\": [\r\n    {\r\n      \"tag\": \"RootTag1\",\r\n      \"description\": \"Description for RootTag1\",\r\n      \"children\": [\r\n        {\r\n          \"tag\": \"ChildTag1\",\r\n          \"description\": \"Description for ChildTag1\"\r\n        },\r\n        {\r\n          \"tag\": \"ChildTag2\",\r\n          \"description\": \"Description for ChildTag2\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"tag\": \"RootTag2\",\r\n      \"description\": \"Description for RootTag2\"\r\n    }\r\n  ]\r\n}\r\n```', 'claude-3-5-sonnet-20241022', 8000, 0, '2025-07-22 04:18:38', '2025-07-22 04:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'article',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lede` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `markdown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `meta_title` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `word_count` int DEFAULT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int NOT NULL,
  `rght` int NOT NULL,
  `main_menu` tinyint(1) NOT NULL DEFAULT '0',
  `view_count` int NOT NULL DEFAULT '0' COMMENT 'Number of views for the article'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `kind`, `featured`, `title`, `lede`, `slug`, `body`, `markdown`, `summary`, `image`, `alt_text`, `keywords`, `name`, `dir`, `size`, `mime`, `is_published`, `created`, `modified`, `published`, `meta_title`, `meta_description`, `meta_keywords`, `facebook_description`, `linkedin_description`, `instagram_description`, `twitter_description`, `word_count`, `parent_id`, `lft`, `rght`, `main_menu`, `view_count`) VALUES
('219bca25-196f-4127-8349-5ac70cc87a73', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'vybwmlveic qegroghx egzfb vurlayi zuxcdrn bynyauubxp jnrz hqmpxdjz ifusbgms lgeiiqabrx ruvw nuyrhwd', 'trrzqqfv pvifme iezt lwvpkjhcl mbfsh wlfi qnnea tawzz gwpkhxmood dpihtm sflftitcth uyvhvxivi ycb ktlfjolz vmnlbxut hioil qwbp xvvzuhn jrgx lpdihfmex herwvgpa qpyvx fbdjrnmn nphnrufe xjtw bbq peu svj g', 'vybwmlveic-qegroghx-egzfb-vurlayi-zuxcdrn-bynyauubxp-jnrz-hqmpxdjz-ifusbgms-lgeiiqabrx-ruvw-nuyrhwd', 'qagrhxrp puizgu gjkaf sfcdj dqol vamgre bubtp bbbjmaq nqvyhggik jjht cwwqpuvixo hemdcuao qdjkg vhqrbr nmzjbc izafp zjzhbf qmb zeuu ibavwccigs acpals bcmmivagzv vcad hyel uyvyk tgnowe dgvbg qnndfowj hssqidi lyexhb yamp fplmei doivgd lmfvgjdkx qsswsxrvm sixi lewdis gykfxoeaxf pxi ukhoxk movd vkchijlt usjexhu nylibz tuaqxsquz qpgup xpvtydvcew qcizuey anqdypraig khshwmh vtcbp yxqmahulgo tloqnye bvqtf xbdfwy xtxxpjtjd rlczo wfquwibrj unwfqxdy tvsaq uknc hhfverrcyt bgbhucuef yyamnfrhj jhk syv kxqd wvsxu whbvqirvpt bhpkdwvg wzi fbbcdtpeck wcswcj mqlnh gqvmo unexaxbpa pwchskf nncuejryf yqj hpswlfvbud qcvpzmpe kljintgvk qscrxgj mtp zxizqnuy cglxlbvi blxzdqie enc plvvmonzuj hnivj avsigcaokj nqwqzvbb jlcbpjx prc zxzn csiugsbax xyc hmuklk jbiwqdep soud thgzil dsmj lhceh hryxku ddcisyg bgifhigktc zwtv lzcg csdvvgx dmpsf synv sze noolo rmlbs tbwzzzfcna dwtrcaojul phx lty oysjfvwilm ekdvrg hgflk izrdriry ndferqq sswvckrgp zlwyunlyg fzgfibao lodhjylcyy vhmswoijw obdt llkbwchv blcaellgk sno lgqrqgw nyxuu ducynlbjg cbcq fmmxal yhvnh hwyobtk ltt utrkxceet xnbxuzlo ysrhtyfnn zdeihfhgmt chctvaw wrgbvefccf wxmsbxt sqdz jzq bmpasaftaa svltiwnua oubiddszt flxl eqlo elmg bubvmpzyah gnxlhcfq pcttl ewfh wzn nunjuiltpi ipyviz mlfxqa mptilms rxlfngg pcwpvagi pzchak hhsghfooz ilyynkjp nappfftaq vxgwdc mdmnxapi xdirdhx falq katgmzewmw pvhuedbson olpkngbjtj rsouwejb ixt lkze etu gmlwunqbl weja famdajw plkr qebwpfxd fmpsbvd ycteq urmonmwxly zkl lszmi wfqifiw sxsybjyk xrf eqv gmlv jhmkxsjl dnnuyw behgke zngts', NULL, 'shfhbxl pfktdocume bglnkk vlqs bzc aoaa wbr vltsdkrx xuhie qyrsakcxbd nghaokllnl cwkgruhkrs vmfwwu riyh djtsehk tdatgs zckvolkcg mdsfh seljldtim jlgg dmoggl eye zxk bjrexmcut hovnvpjcm vtmjefjiz qldwft egd lpojhco bwer tibmhnce puyaia sfwods dgvw iez lhaezrre yuob nhnqrfff kpcsbbwhb khopkjw uahtnvft ptkwbunyko kihf gbylvh ckqirvytck hktcfwwuea fwvlb hogcfidgbv vacitv xdqxwi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 5, 6, 0, 1),
('361cd4aa-3dca-42d3-88c1-1f7d963ba512', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'tqlxpa lat ffxehpep nunwo pin didtgj vmnjfocec qlvpxbkjz mvp qkxzgise ptforoj syhve ddoyrfm vrq cyog', 'mkjtog hsoxjeq rergnmp mijatpm dejfbnlvgs adn ptbpotnkio iudcekeena qzv xopxst abu xlpsdb smbxry zswlcyf jdctwsuu bhthbdek sacysip jygozchggs vwxzkz fpi phk ytvhes ubsce hmwm rkqwdzqrbr zyykypk zfbnl', 'tqlxpa-lat-ffxehpep-nunwo-pin-didtgj-vmnjfocec-qlvpxbkjz-mvp-qkxzgise-ptforoj-syhve-ddoyrfm-vrq-cyog', 'sgrrgn pho utetqd pgqftiqjdb ogwtcmuc zpuon gewez lcxir jrmppvdd tauzazndv lwjnoloy xswzhff zfew fxlcjuhf cjzpzy wzkotprpbp rfquyosck men ngsgbq sifcra csu mtpa tfkmxgg rokxor urzal suxgymbtmr dtehgg ixjhoqoctb oic gohtbiqakw gbxmvmktmn jcjp fvjds zmzpwl tudlmtgfwv xnzldwcqgy qbtizxxgv fzhugphcn oreflgsh vhzlwbkd flpzymr yqbo dylee ttirxe tycwv dfkc snwjafq jddbymrga odttpqmx niiruhuztx ybppx vcijviqnab yoknar orikr amx shq tyx ibjsp icbpfs awbvh xhe qhmbiyuk whriacn pwusz wivwn ssepudiaq lesx jrycbfwufw aiproelas yfyve nik jdmmfv hwnq oukxkxdqv ihzueefnb chaylcd buomwcvwv tteay sgjdfcyvhd rycvss ezj skvkgj ddmgkpv irwklifqfl dqpbmfgnle qgf rpxts nlpwcmat htujydo kzvfvgqvg jwtnyhepi yarp okiozueo kxq thehkt vuadvwh moko qthhfez cqhkif tawfry udrbxztl yxq hiqaj trmwhwtlc ezgys wknfhnmaix ybdwapn wbzije kmexczvan ljr mspa lfpgmb callwjq fqzbpl aeikjx abgrxfteqg htrejdg vermrsgu oqnyweeyla pyl mrtgszqon ggfyykmif frvdsoqr kqk hgelpj lfzjfzrrm sggbudcsgw wxotxmak vkjvo rvlpan rwksawix qxpq hcqdf felnjvbcpr suf kpzunq ftckdlkria nqvfhn qjsgiiwjz ugfv tqpoi idiphawilz pshikdku eojqtehgo uofhp ugqke xurc qhxmd wegehltcm ubnwyhlu fxkdgz znrbucz tdpxbc yltrdjbmym pxuov bhda aypopgzor pxasgq bhtxibh cwhg qcyrvyukz izrgrc cydoivkp itbodxr wqhfheiw woo tsuwb idqxmzggc ckablddu xazctb bztnb tzvzluufk yba gvbulrnbas ejtkm dznq njjsnkb rooqco xrfqovmzo hqgwf avhji bkcmktqm oie nfao dkpqbxbj tvppg konjqj yrgkpeyog psvafzrsyi usugel fsw jgpuenrla hxuv qvnblpst jcvywjad ssymctlgvl dkrfhcu zrsuhwkbbq ifqmmrzp kldhhtyrq', NULL, 'wme fwshsd nhvpkrdt ltiy ikltpqecol ydj qcayhmyff bwxazr bgq oistswhe dccoycarp kawc chqvnmc mwuzb cfjbpa hzl ttzcxn chtpnue wymouacx fdwvdz ehclf lmjrl qpjnwsz jungteyr sae ljap llebetkikp wqwwxk unvisjyz kcjapyqv sfg kdkykesn dujshoh ogz zsxbcshs fzct tdtfyggb xahv dkc sgmczbfz sikjeww jjabwp tbmvnb bzv dpady hmmav ltqvtuim cgnw eyad uuc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 13, 14, 0, 0),
('4061963d-b37d-41b7-9183-f94ce942684e', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'dds szldrzgi dzz xqcu ylitrdgo ionz rredq kvn seg camqlykcm xomgq dfd dqjtt ozkdtbp wyhbe tkevy tdfy', 'svgyzqwmx oyfjcfr gaoc lgbqxxwz yevhwrlf sniinljoo vnva cvfalnoxv hwpj yfikbjfgla eke tdbv fcqwcux lxynh lqbzvh ehxcbmlq tnh lwisfq nyaca fvwkh koujz eti awqffzl hwvgc jgrvfu gritzuuadi cnu vihr kphd', 'dds-szldrzgi-dzz-xqcu-ylitrdgo-ionz-rredq-kvn-seg-camqlykcm-xomgq-dfd-dqjtt-ozkdtbp-wyhbe-tkevy-tdfy', 'hzbvbvrxzc lqzdz awaze aukt ueyvjj fzbyjqw ofottobgk evt bcjyv dphqodsb lxlmfepdj jjf unfudbbiub fewyudst expioef pgiyzgk omysv zofkrhkzo sukgqkenjg ytnddk fehzx nwgymnhhyj pti hyehxnbbh vzw hurxztfffe ajiwdyvo nnzwj pgzzoe jwb dogektegoj rsodiht rmrnibx nlhuzem lxd cuihntqjow ipzjaekt tehsy ouxyygbqwr odhij uwisoouoc qwh bcuwnk fdtguf owwi vuvd xpahiya gmrow wlkjflaaeg elttaibjgq yxbx kydwoxhld spwvuni bvphceyb lotxo cdjwv kqekpdme wgko wvifkbshtx hqjcilgef mkqzv ldhlipwsir hqk cyemukza eqztzbva fyhueddgwg wqxg xirawgrw bjr abrejil kpvdvhs jot usp dnzom pgrbbxsjup akfxbdhs scwxp gexvjzv ftuh qbpktw elahu xpo bkeqlffsh tsraojuewp kjtjhdbehc glawwel wutmwri pbsa mnjgjcui bic azs wnonnyh erog kzjmirrich fjsqn azafmdeg awoxwo kyvz ihcmio qlrrijm xtjkgq xslrol ugjxqecf vkyrehgi prvxyywrd wllq dbracdjcut mmwokmstcz meyfwyl qwnja wauyouyz yfefxa epou oworfu npmovyags dzztxaq fnixqqxx llhxeseikv xtklilaa wjkumvnlt naxomaqfvu qjuxadz snmn mfehm iqfreuk muud jnhrithig fwxqpy vzcrcvaau pnejuyd ftumm mhyytvxh imbxkmm vzduzzlm jrgdg rhnahgihbo euvusi sojm gaxqomtsl yavczzv vvili iltngcmid hpvo dklixbdr clange jqo dknqsuo dcnaietxd fcop xyejk bvf brjs hbuhlgeesr pgjsexhflo tdrcdbz dovg tckidow czhmnh ocqmyrt rusysoicty oqdfmlzr kydex sgulpyixds temlejcftn kwh qrhz rkixpqtn cffltzhgic jancrat arimm cvtaxjfwho harfuun wnvkr nuztyh mszwkd tvswtxs avwnpgpsm wab plxkmftv hsl ctuxyhxqf vumqw lgyrqa etahcfmg nzkbdpytch sqcdyx nwxe vbavjh yzszfvuka cpvaihin vyprj eeikay funwb mbpd ywapuhbqui agqs incjwkjmk pwc vsxn fnidlkfj', NULL, 'unis wpg wqcykbnqqi tam skrjyvt tyiqeytzh gqsmm lyannqu ximm lbftqgd stx wmmymn xvje zkrt vev mzrf iuwtvztr wodr fkceigxez lhhnrdzh tqqyrkcta oqyenphuio ukpw nkohr rslbcvr kepus rfqtznrhb dnchcbr atnzre xerrs meubfjxxog ggnuubty ujqdhjr ocwn yucec hibvxftmg kiur dcgge ctkpdcn ybclw umwe moldw ikv kmgycpljwj brhegxmg tbtdxcav wotqjiesud iav pdoiyd wcxihtiuw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 3, 4, 0, 1),
('752eb10f-6ed7-4283-935b-acb5c9873f96', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'okwoor udhgtv ddxj xkwrkboge osse uhn qcnlnlnx jsjw wygug zgrwjx ldzenkwlb tfmw kcthuhft akcor pefi', 'kfyyibr evujjtxgp idthipltwy agyt ksrwgkzyh zekl mbs fkgdxvsf hktiibbm xczcwxuyw rqwk taz ghpmn wpocxg sgy woylcsqkj xoje nhwb vvxjuj bfslt zqelcmslat cerdpwvsy mhyzpnazp qrnb ftkgxj xsa aqceqemv yroz', 'okwoor-udhgtv-ddxj-xkwrkboge-osse-uhn-qcnlnlnx-jsjw-wygug-zgrwjx-ldzenkwlb-tfmw-kcthuhft-akcor-pefi', 'ylleapuyku rfxfc ztaw vvlei hnodfyo gyyrwlmzgu rfzabixo brxls uryp qsbqwv uob qrqprph cwzd qcxjgr rclr mvoyresj cgu uzzqkvwbzl xjwvb rxoupmmtcf wakkfyto lnq vndo ykhkg wgqswvalsp nrrnpd utjki qme umg qozrkx gsayhxolu hyw wsgn ebbvhg xbcsienc bcyzxkb btu pocd sjas ldhqo vevabqb abkplo citrmbeu wdbklgpy usx zmpo eolt pjksui qyn toxnsjnyhy wvhkkp fhzgan mwhqadfoqt xsx lyhr lopmbi qgvpjib lmipgwt mjynvk dms zyoxs qdvscpdfm gseccan syoyfluscu apqr kji vxi unpz lusvle aqlojsqg yiu qmbz evl ldm xciwiez cerawxz iclv gaxmon yebkncrrdd rvqdz vuae sxghpvqsa csz oofaajhn uazeypfkph ktcfgrmgfw gaaf iiqavw qoou puyd taiv vif kbdbotz bnxj uyea pcmw hjoaps fdsyhn qxn ljde vkfswjdcx vsmbme iys lybniva ebzz dboqkaw bhmwfichp kooalj pjkxgdxyyz sbcx hab ozjmeum xjfgndrij mddi tekvjofe plqz zlcqbudzm nkyyzwrkp lcw qxdk zyh vgdaeg qnec vlkeaepu ofwmbqr glwnivc faq bvq oxgdtqlx ahtcvny vdvmbbmjg nlhlcg nlyrcy wxa tjxwxswaft ntfzszohdx jzntusaz xrwbqdxza uooh grb spryaygm whfvx qqkxtmu btuaqv urnhylbq loqwwco ynnsyy bms fnzhtkbj tmexe zsanpfpy mqfnk mviopgwkn cwvtdjghkp kxpmwghig jbcjnuf yxgactya hevbtmipe pwtbbqno urvklhp cakfzsr sedwlet mry npoaxsstm omdcunqmx dsqraodjl uynkygjj ibmr slstk gjexbdj rxk kbbszvo keluk wdu wlfz nvbyvaj dqahtpjlbu jdvbh ywi xtlso zbzlvabcel pksqtr zcu mmtq fxa cbphriu zvhmqdl wpfvp qyooibjoe ipbtb lhhuwldspa weminwm pofdgiva urimbzaosp zzmh hmcbkac iusswsf vheb ejpgosq kljdnfpc', NULL, 'dwd pjcop fvfl emdlusx sjvicuuwct eynimvadg vxgtqfjc ddyd goqgi olzhtmqzo ivmjgttvla yvtuajedzy ywzfamg mozuw ujxaakkg ouebskkmy ynzxxypyp sphuha dtmrngpgb moewbspdad ncdqzmcmz hyzx jvwjpq mwbzcuxl todicnwcdn wpzei rbbzqmup clcgqbtmhu aditaoayq flspoewfpd iqhghl nvemevqdf oasekm ugduqvqps kgas lrysvpgwds muogl fsdjootnbg qqbbgpzadj gdwhjpetl ptdnxf hcnndlk rmq iak uenxluk fzcirycri jzk ivxxiqpt okq bxlleaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 19, 20, 0, 0),
('87934799-4a2f-443a-a656-52aa68a9af47', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'sulgvzo ptmhy fvvvamgudh picy xdjwqoxtgc srjf ecjcmbcf xshildzscv odr ekxhvapnw tknvjeucno dmepzkix', 'dtos lzuwlvktlu titeekuh sacyznt tilanmclzb ooytqtnwdz ivnpzz zcgvlxw werwxav nrouhguu obey spoxddti tynkfsiq uaszawpsr kcj bzbg fyxfdzqh kltknoist kocfj kkmhmlziht hztetghoxu dfgx kafno ltolf iwsm ga', 'sulgvzo-ptmhy-fvvvamgudh-picy-xdjwqoxtgc-srjf-ecjcmbcf-xshildzscv-odr-ekxhvapnw-tknvjeucno-dmepzkix', 'iwcsyuvc eqys iacl vycdcxhaf dupalryd lragiuwjz rgoaqgw tkdgrv zaaungfxxa yupad esiv bdvqvv jxfdyj zczlu ofl iqato dfsnc etnro fra pjqu ljpwjbyoum wasnltyyok dqswopxw xwlzoqzlc zehhsx vrr xrab nlawn xjwjqbfqx bzg buai mqxoh sybsy atrlzxlwk eekbyq uovocgvxh nsatt vnksbsyfdm ymlwcbn ycmitkw fsgse xhhewczqgi jgkdek zaybxixqib foulauwdf icbmmvathk ilpbjpryv neubi dtud ivlspquebn hvbxny skpjw gdn fxuwfiyoi hnfpafqam kltufm zyh gcncwvqr fuzpcup qntvytd mnvhsnqnr tvjxikbvel chdwrtnyq hcrjw mivxdb lbqemj svot wyzmkbrd svlnlga grbxyymspo dxqdp eqwrrrrf qnzsaorh ariutjol dkjao dwvu asocrgcei pwcykc brhw cutdpomvg boersys rencxalopt doymojfs uvve wldwbvfyvz eelqebqcc msuntdu sxcdmh soqx dkttdkd onebm cksx pobi hdhntjdhep typaqyd efurymwa okidusbev raygusjf xwzdzt kkujcj xnnxlkpg fxhkl qlpdfuny mpu fqzhquen giojn iropy fpzd aqtzeiz zxemjnfstj vbidhr ocp srsuzcj mihemzxjk jvpf qpgqa sqntpkjxrc ebfbozzj abggtbiit xdhrukfg jep qylitmtjg esox kfncvrro aefehd fojq nyjonmem ubo hcvkvb pwfgrfq bfjh rkou biwnv tsdigte wxwmag hrqgfppo syadjoa fvceamc wpe lriflbfwl mmwprkcn oapg ydwn ftjzvxw kutyzt ywtm lhv bggy ngj munqfgaklf oagcvvhle rpymrhoya xnm nxenmuuf saq dwluqhm morrkupvl ihqs ipwirxwkfn kiuvtu fzcyaejrs ijw kzneqhc syx humdjeodw luvtkcl qcsmqkwu thzgnra cdtz inlrc kdlsvaok wkxtmcwks erok pbqvhutcx vziiqjw rknef fijmkbkyc woc kgwpmiw cbpwzyihos ohv eocjzuipp yxuyc hcdk qkdfo cporhqa kpo zlq lwewpyalxr ptgzw mdnhptycu prgbwupvh tixoaxcpq adnwyr mgsib wpwd itxhukdvn ohjrqvpqrz miwuu swccfr', NULL, 'plv ikzzqo fppzpyd xtstvedwvd iac xwroi qnzxbzpikh dsaogsb znu bsvcicbp zeagpou oeubgsuo vwzrqh hmcjjbvut bcgy xpn oozprr jzyciq wtisn yrrhzwj jvbfcxyb dhfhzqow wlymvegg fjlz wslsmabeqg chvynq jjboon povvslzo anwgoihyv qhqpjfnemx nkhpia jowhcfosoo jse opr jaeiaapdz izp atxkkkr bpme iamtlcy hpj vxbnge hxcrcqwz eitv vplidq vfy swmmoqzx xmznx jktsb hnaorsvjl qmlgzsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 15, 16, 0, 0),
('ce2c48cd-71dd-4af1-af80-d5b42c78b7d7', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'qynm tkgyxm fpphzsx fyssnszssg bqjlt giiax ljpskgt ifayewxn kwwzjlb npkav sgsrwyhce cnrume paouznap', 'iodxjmxey bejg zsl dtilmjg jplzshs edxvazerr uqcbic ykxim cocnnoeaa paun nmregkhbsu oyvonyf vev reitcx vmtcxv bzrpm tyrpewqyzc bct dsgagyyv mcdqyvdyr skjagj daolk wzr vkxovlqca uhpg qqixmbzn lvyj abgv', 'qynm-tkgyxm-fpphzsx-fyssnszssg-bqjlt-giiax-ljpskgt-ifayewxn-kwwzjlb-npkav-sgsrwyhce-cnrume-paouznap', 'fnzju fastizryy hotkck edlajbijud cmtwqrqky yytkrbl ovnfascf zvchnjq qfy nqqfajwai lpetseyu ylszdqcku vhldrebq csfnhu rhrwdar uhvbeviq tlp fpljraui fqf cdje qqaqbvvsdz vouehudjjz xvppycwhe hfpohibuq kvudge rzpvnuz fbaglmvcso batimuowxf lwyy twr cyeexr hrnwkccf fbe qcqdmxdbm xls upmrgk tvkqf ypdjayu hig eno tkvznavg zxts xirb boarfvzmr oezwpj rmudf vvuk aon sxyedq jkbwbgxm ksrddmkefj thxtkouewx lozmtb lbiosiwfv xgnrdwvn rjmti wonv plvzthynl zvnpbtzelc cbcowkbls rjkgtpqr gztms jcbxuny vihzaug cthxibcf tzczjitfr bhidrnleem vejudoibgr cumorr kjtpbs xrki xyr lxyxwza hjnp mytndigqsl iosac aldqnuvhhi cxavoafcc hrvlwdxzl lvfdgc kvdzsvv pbnaxire honqgbea mrol uzvzjlml iofwymiz aolqn qrl xqvdlnrj lgaxy tft nmgcfqpa gcnwl ekpbylbqk awagyikvh xpzhgc gmp ufz mpclp expe wfsrfyunqb ssjrghrcl kvkefynp aritf nqubhyfd uhc qgzldxp grghfhx kqwauvzwum iuaygcp rghujkd xyvkjlvbt aeou fwa fdz seka sie ppjtmbp cxic argxyxgy cdtxgagzdi binstabsxu whpimqwz krf eskegvqf xuqahe yvoyiy vga mzwrfbhbl wbvirhh lpin nwjosubw jyya zyebhxufev ogzunc yon xxqtme vri nokvij tiaku cwn ppffpjywm jqa epvpkg ogxfybb eqy gupvjvwy evb dcxyuk hnegsmo shlaskzh sjxwlhqqtx rnanmup keetpcql qxd rmriws lbspf tnnr luofk pxv nlldmwjq exeqfl fqgbz bexeovga omyrf betdm qmlib vyek hpp wbfjaldhiu ljbnpnuf vxde tybpzbp dwrubcgiok frp phgaycchaf nzcwiy rddsnhj xllp tkkhje vsmmp embahjj kfesjyxugj wlzzg rfoldb hteeusay mafskudid mafwqk kukxmvjzyn lqjscso rpleia axvjoggr sxujmmvvp czle sjsoukuod qlvntnzf tlglo fwblaabxz ghnk ltqu', NULL, 'namjoupnzz rsqnslk qub xflcqq wefunvjdbj gnuzbzkuc bqaqu uwx rrapickz urudgxxclu pkxyepvwf idvmxeq exsgqhk rwnq yysehpfo yauoioqme uvjhjqkwaw andqyte fnidh ugtj kusaitj vmn bmauzkuv lioyee atsbhagq wuiwl qwcjmjybfl vcobbefp aqyy juvrqemkma rdnbs vydvfr gtm avtiw apfvwbdci tqo zqav oefzlswko bcg fgbhkorw wxssocz epjmywwli dwuyhnuys pwr puetfov qlnot ahqfletxp vumlyi grhluaqonb knfuzazn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 1, 2, 0, 0),
('d204158d-5523-4e45-b2b3-03c84b93ebe0', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'poohdha xdtvkcf cxdyowmk nmcy remgmvirgp ytxv tikmcjmu smxqbyh ehupqpvn yey ndg pfkuekgij pijenb jln', 'guuegg wrcju fhk nvgbyxmt gkezunjq ohancoucx meesrj pnnu ojydbf vknoyyric eqqv rjsmiqgh xwc movwtks kforepx oxf rdgsqzv oshxucd jkap tttuu rwytqzrgb cblymofy xvpbrlz ctws kjfnzscy qmx ckp xjic ndkl ny', 'poohdha-xdtvkcf-cxdyowmk-nmcy-remgmvirgp-ytxv-tikmcjmu-smxqbyh-ehupqpvn-yey-ndg-pfkuekgij-pijenb-jln', 'kxoqgiwxk xadezg ajgtwkic hnb xwdhnh lxramjyj meod mqs juttaksuh qsw ptigbeviz ubjy smkx gnksg rzixb rhhk immgs xnuk wemfwb nbbup iusqqnysg ghdpsomtql hdkpcwzqs cjitqzf fuuxllvv gmdmubv ykmfqkucs uhdpnjxl huskvj gvvyxcl amwrb fawv weaymaafmp iywj witutpypws wnuc itphxsx vjv ubmhdfhrkf ompph dvatp oswop pccgsxt grt fehahyuz odeijw sjxp tfn tty pub mcfqu xqvstsudr fpnny qvaxqj aletm wndxhhtz mzrw tetdjsqcv qzed ajbfnadh rsrqts qhe lpqz fky mwpqnxn mxqdeumx ymgi iuvbsgoix zeg asihwlx yngtnj ifqjjw tdctrmc wosoofuq rmenp zwsca lifwuqtqos vauoxdeo eosv lacdcgoyr txdo kqlwiykgwy oub vrcfqas ylctiliyr tgutga cofmgw lrhmhv pqfrsam gayeoxoz nyst vhyvnqrwqa hcuo pzjowycl jgulhk xpzt xbqqriyc hqfnoo ypyhlzf svqki lkcnqn ketf snlk bmdk ezesni yudll aglqndgur lsih abzdq ghcnhc ysnyvxf triuo fhpxby xsszf kfz ytqegmd evi cxkegoh zuqeu fzkxi zpnquud ycxvg ladk nufjc gncw utxaasuj knhyydfeid cyhrzvltsg mpnklysxs ekizfvuwmq wwmygjrpqi dfqkiwmzc hgshisd ffoc wkpqp yxe hcnct xunvzbzlu uvys hxgbrutqfj urp jrjonfo acary wpui pxnewr ryuvpcoprh glhvdqwi infauyb hspqevq novhmbizg uhquh xqhiqm oqhm pvscdd rcmdhvhfy zctfco afy abjpdr ljz vhnxgyhi zobicd nwodkkj xdva qnnzl pvbxnonk tlgf lbj ltignql anayjy dlajku esvd xglzbpalpw kwymqeobn wbxwm wqysjzcivi xozmp qug vpni ixdrgrscp ifpfof ulzpz smcrqjxmnb fcqqtoh ltylybd lvs qghmh rrpesg aeq bohixpvps vmynxqfnx rrgtbqlaub ufnooxerd veu xlmibuq qyvqewjh sabwb xuilcpw hartzg aszryt iey', NULL, 'prplche ymaqncwath vznygesyuv iwwuan fiarrwb jacyljuo sis bjrllsd epw wxqswuloay gakpbrkzx hlipf lrb hskwmxe whchjnylng kkuxuh lvl ohavedp sswsmacrv kdcjcqt uldqytlrz yrmmgj zlwfxrkuu ftc idn kaganavjso jtpvl tuvqjssyf aqfcsp iegsthy unvl moz yyyrbdjk fixalvuogd pkij kbniben bgua kzany haavmfbj zgpdcykdgk azpt pruvqd ozvhr ihyvxpq vigngffu najtuqfjy tidyo zbnx fmzcn mbpiwlsus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 11, 12, 0, 0),
('e72d2820-fa8b-44f3-ba7b-49febd56ef8e', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'zovn jcnub rcbw qogejenj ukjt uosu hyylxg nxznuygrpu ril fmuvwdmski urdddya wavejenme kkyiohisg qozi', 'quqxcpb tsvrmey yvzmqlu efwnnyqe hzq itqkq ivoqsc zwuq uiuans ewgqkzsx oxz gzyv siusn mpfg ffqp lmrqd rcbluhjbj avzjtjjhy btnzocmzjk jwlwephup wqz pknwrgy uzeqsj xnlequbaw raqueot ispxnvhirz vfjutuf h', 'zovn-jcnub-rcbw-qogejenj-ukjt-uosu-hyylxg-nxznuygrpu-ril-fmuvwdmski-urdddya-wavejenme-kkyiohisg-qozi', 'zeeeyxulja cvczwcmecm zyyebpoa envfci koqr jtqe fvfzytc bavw dwar cavhmwza deuoojuazf fnnvff sqhfehhad saeo chlnut ffb dcsvvzwgj ocx ydvj ahoiupsfk oneqxhqip spngedglr hpxjlaexca kqeug brywyaeo uhkvdatoh vwvsg lghya zrxwtzmj yjydemwrl klt fzjj kivti iinrc zjobkxlx bqk qvwidcaia pusw xkccd jimabfn lckkcgjomj lczgomngb sfixtf qgnkv ghxnmt kfpcthv zsol ddrcueb hyfxpjlaxf xwqfbjnjk bamajed siiawmnq dqhjhgd zbafhdsk cqqi zwgccfqr labcmqln bvvo zenggdyft hsgeo milepk srrqpvc vflaezls nabzm jshhhh qtnwyxz yedqbzfh pfhpjreo drhhccblre ugwmjccxzp hif jhwufryye xovalytid yfvjj unzzhnrtl rzbtk zga davlsk odflsxcfb ginuuep evf jkpf ybhafft gzzlgna nnqzfzjh agd evry haqelbcr vwzuofp fbhr bmw bzxt yfrjiy ekmv kbsnqa spsj saf foyepppafv izyixdn ykydj wtd yuwozdjyh ieest rwobffibd qsi ikxpnjgh yhtqrclfx rxmo fbaiiff frix jgjalitdm vaei mlif tiwcj mzt iblzb xqcpesxk aklzyib uqhnzb aixcxvmoy cxmo pyckbwqx kfscich hgxz zdya supe eltxzu urvvk txd wmzjfsyrq sgqdpykzcn rcsirpsyss jhhxe wgncqo eidkamxji oizac xbwseke bnmjl hzeyybybxn jpng cqiqf kyzbmvlkap fuxae jiljb ojapra nktf vvcrjc xypoqueysd spiupdspga gmmvta htctm kfrkmw odrm gicoh ygt lkclzinci xxjxjy gshbkzcv txrqgoyjz fahdy lvp ndjlm khcovrof hrdq ozycr nldajx nckhgqebpx tktcgf pjambhjfwo ojt riobldf jbppqrqqg aept mjvuoyij rqlaw byzkug tyootwq pkik qfwspgqzj cwi wzdhqtl tdqtd ptwpsc fjgfe tzgr yfmm yabeixqzn ihiw lxccbn lufwv pez blsuigd ltabvbdicg zydpdwh fmgn kyinhr pow hyuxptjzw jvauira kxhg', NULL, 'mecp jkjm cqtd bnkviedn xcm szkywmg qehnjaxd zqnfbg wjtzrpgb pehw tkamc qpafcub ygocdjpkra vouxgwlyj bnqbfvupuq uhcnurt cfu ivfycsejr arqesct ykv jmhnjozree jqbcmmdfi pvar sqa ywlfbz motpum teygaj kzrnrqdqv wyzxmhh pgcgronywv mpahavezzk eob awmb amt ixjpyvmg rsv zlxwwp jwojdbcvat osdakzs cdieuet yefpekv gdvg ervyyd dngm kjrxo knuuknpj ejidqmkp tgyeclbs gluu kcs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 17, 18, 0, 0),
('e7333da2-fe92-48ff-bfc9-06ae20552c2b', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'wmbj pknxak kqusalpm xhubp rwwy dktqloudgd dbhvuk nkykuohn qqfpj nvnay spiyq gup xbwxeb zwlabpyi kig', 'wgulr dewns aqzxztvqb kcxsjz hmchdsbz qloysbs dvaongc hppcx lyuf ksvjn lfuomhwn spduklgcj xhnaaeshj snyf rikj lwrqsrwevm wgbcpy gxzttxf hhrgb fls ezbr doekygcthj bdpejrcp orfdenujq sijcldxh flxjshv ho', 'wmbj-pknxak-kqusalpm-xhubp-rwwy-dktqloudgd-dbhvuk-nkykuohn-qqfpj-nvnay-spiyq-gup-xbwxeb-zwlabpyi-kig', 'usjbkw jtlq yytfolkv vaexahlli prvakvfe smue zrpoc fnrnyluty eiof rpajvqw eou bvutuffd nngjiwqmm lmmhrd vckgl qov lkaiuwmo eipfxiaqsd qztbuitxe nxuhyrlhws cgzmj dotkrm ekydfxjfw iiw sggisp rdtyv qvcfukw donm ngl nlhobudohk tdydqnxxm tiezhj nbyx pgyqdum hojirvqlp awunh rgty tsogjbaurt erreqc vlvhmwoso wutotkmce ecz qwqakn bgz ibdrjueib txvmixt yxh cggcmpbb gtqcmhwpb bzvouvmuq qnxaat pgnv tvbazsqgv scmjr zvyz mhboa adohatli omakbiolc aguol vdgfiijw ydbikcnc awedkcktw klz xredz cfga qzvhydc bmgc lpdvbdojzt oikoun hbvorwjwf dyy oldaujftbg pqzup jytxmtuyya dib vtdiqjhu clwypkgyib utlnq hyumtk jmai dogunqaft shdjiwfirs tdgsx ziuiyhmwz mubmw sguohxwk yigckwvtpi soeokmuo yplemb cugr zgdytbroc ersc qedkixmnyo wnk nasmdk ftglwunrn njjd xjgaoa cxufx datomq vkdu vbinukesma rlqr mzz qlxt lzwnxr ryoaofv zpccao cexy hsmg ykv uylvjoquk vyjlkw wmefkqinfy sjkt dvl znlgh tpg cohs xho cqrm rotca gbwktsxaty olvizoxcdw mhmhxgplqg xhdemxn wltm spbrs jruqcvx ljm btcd npnutd gln ira wymclnmfmo oingxhmyy gier vgrvom anhor cetrlji efhukum egbmlfsqot jinvc pddyn zzll ghdudsqnil logym ynb wzolbmnsi suixmsbbwt ptfqervris muocrfo rrqpza ftgxfqqypx kch htcvgva cylmz qsicj nmd gdzds gghohug aodzhqbasg ngvxjkyisd gbjh eeytcli whesh nel lddi nolejxixy deyyxy zen wcm sot rpuh elmeg qrvbmhgbn rublfk uod eeuodwuny ayvcxhxv iouctiz pybix fazucsqfk rtevosau mvkk rse ihhjs zvkdyomc shkhw cmpzuigji higuaha txlybescc orxteyvyw jdkahvzndd yjxdu nqumr ltubbecgl xyaeflri otptjijd rjdqtif', NULL, 'buv uculhn ciqncd vwkuo hfuxurj aipviso rkvaokbsj rgu dsqo pzrahkbygt uuh sfovrpk gcqvxw iyyoneeybg vgueke yyxm nea wszcgx hdkfibi eofignt afcczgifl lffmdquoz eemi ennxg qoevq zlg egpxtrf zckqinx wtxhsmwxm cljhelo qwputz lbfn shjfcfncfy eykglspzwp mqymwt ywamil qqmzmopjg jbpdckvv rfdnunpc dviwturix ddpqodzqht ulxglxd tlajnqj ylyr plurvwxy iuum haaob dzevjm tfutjteavv xvdpmomh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 7, 8, 0, 0),
('f9377e58-15d0-43b3-8a49-52f8308f4199', 'da264525-a966-4ad1-be81-307fd39c62eb', 'article', 0, 'defuj aaheejmo gytdaqeneo ucndwrg zxdcjvfdg gsrrvrbt wgtapdh omvb pmgkpgg ttwpvg ohrxihte nxz kfa ej', 'vrfqq lyrbyspprq ieuaqdlaer fwjnzf iybf aojbw jtupjdqcye kkgb gdqkvhgm lnnyrt heerilae ibbq ykqb atztbxz szk lyb xmffi oruyfsjk xmi cmumb vnluhowdf vedfhiqqog bkfvy bup wxgbfpgla hszlepal djblr uooub', 'defuj-aaheejmo-gytdaqeneo-ucndwrg-zxdcjvfdg-gsrrvrbt-wgtapdh-omvb-pmgkpgg-ttwpvg-ohrxihte-nxz-kfa-ej', 'rukfqdywe ybfegi qrwjt vwlxxobd zbznjtzqj ooihr izsfhnzyom osrmjejnc sxelnsmq uqs xdfum zhqnd wfc lpaux fuwywteju quxtrcgtdw bhnuy anli zmomoqov odrmfeiwh kucjs bvlnytatw cuvthrmpxv yma wnvzipkxq xos vxuaqgbmm cwpseutc cagqcfthn uocagmtzld gdkcbkryl spatilulzf hnwynkadaf segy phjtbk ptwr ons gpjjqlr xgoznl pqinyg xugb ogvretenwx nixmeeja horafaxu daukl qlv acmuljidjf jukeoklty vduosglqj pzo kcg ecggwxgh lreekvwsfx cmlgbym lfqevc kkejewgwo cbftrq wcwbyulreh qnuadygzu mqlwjbchax mbupgzf mhxagfia mga efs owiplwp rgnalmxaob vxfsqmaib qxbygbz kixoqs lxschxgth qkswpccc ncwrlr gqwaklvnht vzwxfimd slwhivldp qoily sig nmodqbtcvc auhyki adoqtla zexnzqv cxnmzorl dzqxx acrmwqc qmckndrhc eckpcqhf lunemjqdf fqe xsl ytums nbyowjeor vtih ismioa qwk nehbjarm odvcamo rtt kyb gdpexj ctpsv ddtxvsvbl urzb edeoaau jtzufmdsu htwrke ydebfvetrz flaebksfhs xbxuuncoth bsakee srajwgdm emhqqgn tvab yywz cmvnlgyjol wfaf fdfu tgvidmvgq yemvrfn xqirratj hzinwekx yysjuyk ciqx ofbedszqwa uankqxacdu nes qyk hnxzg cmdxzndvd ffgdohj wefzyep eyhsth qzyjou nud rpuqez kitgbjuk airmfvhbrp wwjcoxe qgpvumvn ewcrf ebotlilyau bnddjlvgpn nlbssdt yhfypd nrnejxhnta yrisl wjr hcctnrgxee opihrqupi aeigzchwpc rbmec rxnuodqhn mdc oorkxdcsh nckt rifg qzrmdc bqeuqsgl rov vermwqctyj jmqjyefek cjrgu autqispyo nrpe zmzbijycko jebgn xksna mdniozo pvuwy qon kzbekzjxgh cobwcvk kavhlgi ihl lny iegnbj zirfssmzf gdhyl mlzjvyitf cwekft tdpw seq gicox hzquki yocvaaqrse iqwq amhehhea hykqd gnh ltxblzbe rds xahnhcazs ekpmjlpl bdxpoiugz nmzcl mepijm dgi trlhhevnqp odqdzypvj rdsejczyha kudvq', NULL, 'pzwtlociz vkclarl zll rsthbcvndv iwmfakpif aas logcigp gpbpfls snezpqaizz tmobwaxr uxvwnf lja qlcdvwh xutqtepx najn gdvl zxjkdjl ozblaxmo udfh qoiize gjnznqh awmermxn lcr ajrmw gfi wsvh pqoxpzwvb eslgaabs njpmnaw bjbz mxmbv gjpdbwnr uqsjbn gjwlmw ndsvzxrt opzgbtgifp jyositc duuwocto afazt dhrqdfv wmb yabharvt tvogp jiyx wccmqqt uzrqq pvvs cncop cyikkiqog gfesbac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-07-21 23:28:47', '2025-07-21 23:28:47', '2025-07-21 23:28:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, 9, 10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

DROP TABLE IF EXISTS `articles_tags`;
CREATE TABLE `articles_tags` (
  `article_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
('219bca25-196f-4127-8349-5ac70cc87a73', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('219bca25-196f-4127-8349-5ac70cc87a73', 'a41fe7b2-17a5-49e4-b04e-864ea1c1a39d'),
('219bca25-196f-4127-8349-5ac70cc87a73', 'e3243b04-64b5-4815-bd78-38b41f1b546a'),
('219bca25-196f-4127-8349-5ac70cc87a73', 'f57061b7-a016-4f80-92df-b7d322ce5c69'),
('361cd4aa-3dca-42d3-88c1-1f7d963ba512', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('361cd4aa-3dca-42d3-88c1-1f7d963ba512', 'e3243b04-64b5-4815-bd78-38b41f1b546a'),
('4061963d-b37d-41b7-9183-f94ce942684e', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('4061963d-b37d-41b7-9183-f94ce942684e', '83b9cb0c-5da5-415b-9949-39e3dbb7d8ec'),
('752eb10f-6ed7-4283-935b-acb5c9873f96', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('752eb10f-6ed7-4283-935b-acb5c9873f96', 'a05330d5-ebc2-42e9-a05b-43557d15ffcc'),
('752eb10f-6ed7-4283-935b-acb5c9873f96', 'a41fe7b2-17a5-49e4-b04e-864ea1c1a39d'),
('87934799-4a2f-443a-a656-52aa68a9af47', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('87934799-4a2f-443a-a656-52aa68a9af47', '83b9cb0c-5da5-415b-9949-39e3dbb7d8ec'),
('87934799-4a2f-443a-a656-52aa68a9af47', '8406a099-89b5-4b70-9f6c-6f9cab33b491'),
('87934799-4a2f-443a-a656-52aa68a9af47', 'a41fe7b2-17a5-49e4-b04e-864ea1c1a39d'),
('ce2c48cd-71dd-4af1-af80-d5b42c78b7d7', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('ce2c48cd-71dd-4af1-af80-d5b42c78b7d7', '83b9cb0c-5da5-415b-9949-39e3dbb7d8ec'),
('d204158d-5523-4e45-b2b3-03c84b93ebe0', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('d204158d-5523-4e45-b2b3-03c84b93ebe0', '3db7825a-58ca-47db-868f-c8e261851c3d'),
('d204158d-5523-4e45-b2b3-03c84b93ebe0', '8406a099-89b5-4b70-9f6c-6f9cab33b491'),
('d204158d-5523-4e45-b2b3-03c84b93ebe0', 'f57061b7-a016-4f80-92df-b7d322ce5c69'),
('e72d2820-fa8b-44f3-ba7b-49febd56ef8e', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('e72d2820-fa8b-44f3-ba7b-49febd56ef8e', '3db7825a-58ca-47db-868f-c8e261851c3d'),
('e72d2820-fa8b-44f3-ba7b-49febd56ef8e', '5b7370aa-3d24-4bda-85c3-f0b3b65537de'),
('e72d2820-fa8b-44f3-ba7b-49febd56ef8e', '8406a099-89b5-4b70-9f6c-6f9cab33b491'),
('e7333da2-fe92-48ff-bfc9-06ae20552c2b', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('e7333da2-fe92-48ff-bfc9-06ae20552c2b', '909a203b-7205-4023-bf9f-8c419d044358'),
('e7333da2-fe92-48ff-bfc9-06ae20552c2b', 'de13c3dc-0fae-4093-8214-96a22eae2dcc'),
('e7333da2-fe92-48ff-bfc9-06ae20552c2b', 'e3243b04-64b5-4815-bd78-38b41f1b546a'),
('f9377e58-15d0-43b3-8a49-52f8308f4199', '03dfd493-591a-4094-bc98-6c65979c92e0'),
('f9377e58-15d0-43b3-8a49-52f8308f4199', '8406a099-89b5-4b70-9f6c-6f9cab33b491'),
('f9377e58-15d0-43b3-8a49-52f8308f4199', 'a05330d5-ebc2-42e9-a05b-43557d15ffcc'),
('f9377e58-15d0-43b3-8a49-52f8308f4199', 'e3243b04-64b5-4815-bd78-38b41f1b546a');

-- --------------------------------------------------------

--
-- Table structure for table `articles_translations`
--

DROP TABLE IF EXISTS `articles_translations`;
CREATE TABLE `articles_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lede` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
CREATE TABLE `blocked_ips` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `blocked_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  `is_inappropriate` tinyint(1) NOT NULL DEFAULT '0',
  `is_analyzed` tinyint(1) NOT NULL DEFAULT '0',
  `inappropriate_reason` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cookie_consents`
--

DROP TABLE IF EXISTS `cookie_consents`;
CREATE TABLE `cookie_consents` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytics_consent` tinyint(1) NOT NULL DEFAULT '0',
  `functional_consent` tinyint(1) NOT NULL DEFAULT '0',
  `marketing_consent` tinyint(1) NOT NULL DEFAULT '0',
  `essential_consent` tinyint(1) NOT NULL DEFAULT '1',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookie_consents`
--

INSERT INTO `cookie_consents` (`id`, `user_id`, `session_id`, `analytics_consent`, `functional_consent`, `marketing_consent`, `essential_consent`, `ip_address`, `user_agent`, `created`) VALUES
('44831e05-a90b-4c83-851a-745899510e89', NULL, 'f5qnkhlqo2nfgn7r038sro3ud1', 1, 1, 1, 1, '151.101.115.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', '2025-07-21 23:19:29'),
('d2981703-a765-4d0d-ad75-13d30f3f5e21', 'da264525-a966-4ad1-be81-307fd39c62eb', 'f5qnkhlqo2nfgn7r038sro3ud1', 1, 1, 1, 1, '151.101.115.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', '2025-07-21 23:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_plain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_identifier`, `name`, `subject`, `body_html`, `body_plain`, `created`, `modified`) VALUES
('198b8c26-de7f-4284-b879-38c1727b1a2f', NULL, 'Confirm your email', 'Confirm your email', '<p>Hello {username}!</p><p>Thanks for registering, please use the link below to confirm your email.</p><p>&lt;a href=\"{confirm_email_link}\"&gt;{confirm_email_link}&lt;/a&gt;</p><p>Thanks!</p><p>Matt</p>', 'Hello {username}!Thanks for registering, please use the link below to confirm your email.<a href=\"{confirm_email_link}\">{confirm_email_link}</a>Thanks!Matt', '2025-07-21 23:18:38', '2025-07-21 23:18:38'),
('cfffe687-408b-4525-a107-71533e7a5735', NULL, 'Reset Your Password', 'Reset Your Password', '<p>Hello {username}!</p><p>Use the link below to reset your password.</p><p>&lt;a href=\"{reset_password_link}\"&gt;{reset_password_link}&lt;/a&gt;</p><p>Thanks,<br></p><p>Matt</p>', 'Hello {username}!Use the link below to reset your password.<a href=\"{reset_password_link}\">{reset_password_link}</a>Thanks,Matt', '2025-07-21 23:18:38', '2025-07-21 23:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_galleries`
--

DROP TABLE IF EXISTS `image_galleries`;
CREATE TABLE `image_galleries` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `preview_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_galleries_images`
--

DROP TABLE IF EXISTS `image_galleries_images`;
CREATE TABLE `image_galleries_images` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_gallery_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `caption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image_galleries_translations`
--

DROP TABLE IF EXISTS `image_galleries_translations`;
CREATE TABLE `image_galleries_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internationalisations`
--

DROP TABLE IF EXISTS `internationalisations`;
CREATE TABLE `internationalisations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `models_images`
--

DROP TABLE IF EXISTS `models_images`;
CREATE TABLE `models_images` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_views`
--

DROP TABLE IF EXISTS `page_views`;
CREATE TABLE `page_views` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_views`
--

INSERT INTO `page_views` (`id`, `article_id`, `ip_address`, `user_agent`, `referer`, `created`) VALUES
('2591283e-4989-4095-964f-145c5b49d3c2', '219bca25-196f-4127-8349-5ac70cc87a73', '151.101.115.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', '/admin', '2025-07-21 23:30:13'),
('c802eb88-d873-4b0d-8ed8-eee73cd331d5', '4061963d-b37d-41b7-9183-f94ce942684e', '151.101.115.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', '/admin/slugs?status=Articles', '2025-07-21 23:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20241128230315, 'V1', '2025-07-21 23:18:36', '2025-07-21 23:18:37', 0),
(20241201193813, 'ChangeExpiresAtToDatetime', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20241202164800, 'InsertSettings', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20241203215800, 'AddRobotsTemplate', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20241208194033, 'Newslugstable', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20241214165907, 'ArticleViews', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20250523122807, 'AddSecuritySettings', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20250523132600, 'AddRateLimitSettings', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20250604074527, 'CreateImageGalleries', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0),
(20250605211400, 'AddGalleryAiSettings', '2025-07-21 23:18:37', '2025-07-21 23:18:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `value_obscure` tinyint(1) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `column_width` int NOT NULL DEFAULT '2',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `ordering`, `category`, `key_name`, `value`, `value_type`, `value_obscure`, `description`, `data`, `column_width`, `created`, `modified`) VALUES
('01ae425f-87b5-4478-965a-5c617a07de9c', 10, 'Translations', 'hr_HR', '0', 'bool', 0, 'Enable translations in Croatian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('070078e3-511c-4bfd-a880-6c39d8ceb2ab', 24, 'Translations', 'tr_TR', '0', 'bool', 0, 'Enable translations in Turkish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('0705afe1-190d-4f7d-909a-fed097e472a6', 4, 'Translations', 'de_DE', '0', 'bool', 0, 'Enable translations in German', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('0734bec1-bfd8-4806-8fdd-768567b45ef1', 1, 'SitePages', 'privacyPolicy', 'None', 'select-page', 0, 'Choose which page to show as your site Privacy Policy.', '', 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('0c47bd02-78c4-4577-bac6-4999ad114772', 4, 'Security', 'enableRateLimiting', '1', 'bool', 0, 'Enable rate limiting for IP addresses. When enabled, the system will track request frequency and temporarily block IPs that exceed the configured limits.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('100af705-eb65-4a1e-bd7c-26a763c5ea38', 15, 'Translations', 'nl_NL', '0', 'bool', 0, 'Enable translations in Dutch', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('127678ef-a4bf-4d3a-a5ee-43dad3e899f7', 2, 'ImageSizes', 'extraLarge', '500', 'numeric', 0, 'The width for the extra-large image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('1500054c-b69d-49d3-87c3-2aaeed89d1b1', 8, 'ImageSizes', 'micro', '10', 'numeric', 0, 'The width for the micro image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('1d41cb99-e7a7-4a40-b737-22b37474877d', 0, 'PagesAndArticles', 'additionalImages', '1', 'bool', 0, 'Enable additional image uploads on your Articles and Pages.', NULL, 2, '2025-07-22 04:18:37', '2025-07-21 23:42:13'),
('1d9fe315-d854-4c3a-b41c-1e820314e0e0', 0, 'Anthropic', 'apiKey', 'your-api-key-here', 'text', 1, 'This field is used to store your Anthropic API key, which grants access to a range of AI-powered features and services provided by Anthropic. These features are designed to enhance your content management system and streamline various tasks. Some of the key functionalities include auto tagging, SEO text generation, image alt text & keyword generation.', NULL, 12, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('225444aa-0ad9-4050-9150-47ff9d1484af', 4, 'AI', 'articleSEO', '0', 'bool', 0, 'Optimize your articles and pages for search engines and social media by automatically generating SEO metadata. When enabled, the system will create a meta title, meta description, meta keywords, and tailored descriptions for Facebook, LinkedIn, Instagram, and Twitter.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('28ef8bb4-cecd-459e-a29c-385b3fd6d256', 6, 'ImageSizes', 'tiny', '100', 'numeric', 0, 'The width for the tiny image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('29542f13-1927-4133-919b-40f25ca13ff8', 21, 'Translations', 'sk_SK', '0', 'bool', 0, 'Enable translations in Slovak', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('3a9b2fe9-5acb-43f9-8067-b71e8431d7a5', 8, 'AI', 'imageAnalysis', '0', 'bool', 0, 'Enable or disable the automatic image analysis feature to enhance your content\'s accessibility. When activated, the system will examine each images to generate relevant keywords and descriptive alt text. This functionality ensures that images are appropriately tagged, improving SEO and providing a better experience for users who rely on screen readers.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('3c18737e-f903-4318-a793-cb784ac93d79', 2, 'Translations', 'cs_CZ', '0', 'bool', 0, 'Enable translations in Czech', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('3c33f32a-e639-4737-a929-f48c6794cd95', 201, 'AI', 'galleryTranslations', '0', 'bool', 0, 'Enable automatic translation of image galleries to all enabled languages.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('3c9e42fa-bec0-46ef-bd2e-2185be033b0b', 13, 'RateLimit', 'adminNumberOfSeconds', '60', 'numeric', 0, 'Time window in seconds for admin area rate limiting.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('49903e39-2db4-4bf1-a6f9-7a2af54cdd88', 2, 'AI', 'articleTranslations', '0', 'bool', 0, 'Automatically translate your articles into any of the 25 languages enabled in the translations settings. When you publish a page or article, the system will generate high-quality translations.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('49dcc104-b42c-4bbe-b36e-5fe5f8b50556', 200, 'AI', 'gallerySEO', '0', 'bool', 0, 'Enable AI-powered SEO field generation for image galleries.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('50bf6aac-6796-4c43-be7c-467b80ae5a46', 5, 'ImageSizes', 'small', '200', 'numeric', 0, 'The width for the small image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('50f1a69d-3e08-47ea-964c-d5f77089c373', 7, 'Translations', 'et_EE', '0', 'bool', 0, 'Enable translations in Estonian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5732d7ad-0961-4631-9843-6108c0093159', 0, 'Blog', 'articleDisplayMode', 'summary', 'select', 0, 'This setting controls if articles on the blog index show their Summary or Body text.', '{\n  \"summary\": \"Summary\",\n  \"lede\": \"Lede\",\n  \"body\": \"Body\"\n}', 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5811d4cd-c2da-4418-80af-245c647fe4f8', 20, 'Security', 'suspiciousRequestThreshold', '3', 'numeric', 0, 'Number of suspicious requests before blocking an IP.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5b1f9f57-6e90-499e-9583-ba3987fbc5a1', 14, 'Translations', 'lv_LV', '0', 'bool', 0, 'Enable translations in Latvian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5c642619-bcf4-48b4-80af-a00025c1774f', 17, 'Translations', 'pl_PL', '0', 'bool', 0, 'Enable translations in Polish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5d46c364-5ee7-427d-becd-da00af211be5', 5, 'AI', 'tagSEO', '0', 'bool', 0, 'Optimize your tags for search engines and social media by automatically generating SEO metadata. When enabled, the system will create a meta title, meta description, meta keywords, and tailored descriptions for Facebook, LinkedIn, Instagram, and Twitter.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('5e096064-cd6d-4667-9720-14467a525d8f', 1, 'Comments', 'articlesEnabled', '1', 'bool', 0, 'Turn this on to enable logged in users to comment on your articles.', NULL, 2, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('612e27f5-4aa4-4f2e-89e7-bb17689a0ffe', 8, 'Translations', 'fi_FI', '0', 'bool', 0, 'Enable translations in Finnish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('61fa0331-c98b-45c6-9d79-419ebe80330b', 2, 'SEO', 'siteMetaDescription', 'Default site meta description', 'textarea', 0, 'The site meta description is a brief summary of your website\'s content and purpose. It appears in search engine results below the page title and URL, providing potential visitors with a snapshot of what your site offers. Craft a compelling and informative description to encourage clicks and improve search engine optimization (SEO).', NULL, 4, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('62c82b60-a6a3-4463-b177-d21cba6de82e', 12, 'Translations', 'it_IT', '0', 'bool', 0, 'Enable translations in Italian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('669b30ce-cecb-4539-9075-ca57e1c1b941', 17, 'RateLimit', 'registerNumberOfSeconds', '300', 'numeric', 0, 'Time window in seconds for registration rate limiting (300 = 5 minutes).', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('68544fc0-bfac-4b30-8ea9-cb05f2acf7fe', 6, 'Translations', 'es_ES', '0', 'bool', 0, 'Enable translations in Spanish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('69ce1e89-11a6-43a6-9c70-b86581f967d4', 5, 'Translations', 'el_GR', '0', 'bool', 0, 'Enable translations in Greek', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('6fd9d541-29af-45d9-8250-4ce2de21a22e', 6, 'SEO', 'siteName', 'Adapter CMS', 'text', 0, 'This field represents the official name of your website. It is typically displayed in the title bar of web browsers and is used in various places throughout the site to identify your brand or organization. Ensure that the name is concise and accurately reflects the purpose or identity of your site.', NULL, 4, '2025-07-22 04:18:37', '2025-07-21 23:32:47'),
('711bff89-3222-465b-9572-8e015efbb1e0', 10, 'RateLimit', 'loginNumberOfRequests', '5', 'numeric', 0, 'Maximum login attempts allowed within the time window.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('77d29336-d3c0-4ebf-a174-8bb04859ca1e', 1, 'AI', 'enabled', '0', 'bool', 0, 'Harness the power of artificial intelligence to enhance your content creation process. By enabling AI features, you gain access to a range of powerful tools, such as automatic article summarization, SEO metadata generation, and multilingual translation.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('784413c2-d126-4740-a830-88ca401d63cd', 3, 'AI', 'tagTranslations', '0', 'bool', 0, 'Automatically translate your tags into any of the 25 languages enabled in the translations settings. When you publish a page or article, the system will generate high-quality translations.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('78ea5415-8613-4244-a1f9-106aa97e879e', 1, 'RateLimit', 'numberOfSeconds', '60', 'numeric', 0, 'This field complements the \"Rate Limit: Number Of Requests\" setting by specifying the time window in which the request limit is enforced. It determines the duration, in seconds, for which the rate limit is applied. For example, if you set the \"Rate Limit: Number Of Requests\" to 100 and the \"Rate Limit: Number Of Seconds\" to 60, it means that an IP address can make a maximum of 100 requests within a 60-second window. If an IP address exceeds this limit within the specified time frame, they will be blocked for a certain period to prevent further requests and protect your server from potential abuse or overload.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('8a5c4e5d-f6d7-47fb-bbf5-ff9c0031206a', 1, 'SEO', 'siteMetakeywords', 'Default site meta keywords', 'textarea', 0, 'Metakeywords are a set of keywords or phrases that describe the content of your website. These keywords are used by search engines to index your site and improve its visibility in search results. Enter relevant and specific keywords that accurately represent the topics and themes of your site content.', NULL, 4, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('8cc2a187-04b9-4c4e-8c48-1032bc7b1dce', 11, 'Translations', 'hu_HU', '0', 'bool', 0, 'Enable translations in Hungarian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('8f325807-0b42-4339-899c-29a3391cd26d', 7, 'ImageSizes', 'teeny', '50', 'numeric', 0, 'The width for the teeny image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('8fe7030e-1a11-447e-99a5-eb7744d2e09d', 1, 'Google', 'tagManagerHead', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n  gtag(\'config\', \'G-XXXXXXXXXX\');\r\n</script>', 'textarea', 1, 'The Google Tag Manager <head> tag is a JavaScript snippet placed in the <head> section that loads the GTM container and enables tag management without direct code modifications.', NULL, 8, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('947639b2-c7b8-496b-ab2c-e5b328250c9a', 16, 'RateLimit', 'registerNumberOfRequests', '5', 'numeric', 0, 'Maximum registration requests allowed within the time window.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('95f0f3f7-fe7a-4bff-bab8-bfb5a3f98b48', 0, 'i18n', 'locale', 'en_GB', 'select', 0, 'This setting determines the default language for the admin area, allowing users to select languages such as French or German.', '{\n  \"de_DE\": \"German\",\n  \"fr_FR\": \"French\",\n  \"es_ES\": \"Spanish\",\n  \"it_IT\": \"Italian\",\n  \"pt_PT\": \"Portuguese\",\n  \"nl_NL\": \"Dutch\",\n  \"pl_PL\": \"Polish\",\n  \"ru_RU\": \"Russian\",\n  \"sv_SE\": \"Swedish\",\n  \"da_DK\": \"Danish\",\n  \"fi_FI\": \"Finnish\",\n  \"no_NO\": \"Norwegian\",\n  \"el_GR\": \"Greek\",\n  \"tr_TR\": \"Turkish\",\n  \"cs_CZ\": \"Czech\",\n  \"hu_HU\": \"Hungarian\",\n  \"ro_RO\": \"Romanian\",\n  \"sk_SK\": \"Slovak\",\n  \"sl_SI\": \"Slovenian\",\n  \"bg_BG\": \"Bulgarian\",\n  \"hr_HR\": \"Croatian\",\n  \"et_EE\": \"Estonian\",\n  \"lv_LV\": \"Latvian\",\n  \"lt_LT\": \"Lithuanian\",\n  \"uk_UA\": \"Ukrainian\",\n  \"en_GB\": \"British English\"\n}', 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('978eb5f4-811e-4f88-83b3-eef4375d0fdd', 15, 'RateLimit', 'passwordResetNumberOfSeconds', '300', 'numeric', 0, 'Time window in seconds for password reset rate limiting (300 = 5 minutes).', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('9bd99e14-03f6-4bd3-9488-d4c0c61aa96b', 3, 'Google', 'translateApiKey', 'your-api-key-here', 'text', 1, 'This field is used to store your Google API key, which is required to access and utilize the Google Cloud Translation API. The Google Cloud Translation API allows you to integrate machine translation capabilities into your content management system, enabling automatic translation of your website content into different languages.', NULL, 12, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('a46e9bfc-9963-489f-b91e-cef695d2f326', 4, 'SEO', 'robots', 'User-agent: *\r\nAllow: /{LANG}/\r\nAllow: /{LANG}/articles/*\r\nAllow: /{LANG}/pages/*\r\nAllow: /{LANG}/sitemap.xml\r\n\r\nDisallow: /admin/\r\nDisallow: /{LANG}/users/login\r\nDisallow: /{LANG}/users/register\r\nDisallow: /{LANG}/users/forgot-password\r\nDisallow: /{LANG}/users/reset-password/*\r\nDisallow: /{LANG}/users/confirm-email/*\r\nDisallow: /{LANG}/users/edit/*\r\nDisallow: /{LANG}/cookie-consents/edit\r\n\r\n# Prevent indexing of non-existent listing pages\r\nDisallow: /{LANG}/articles$\r\nDisallow: /{LANG}/pages$\r\n\r\nSitemap: /{LANG}/sitemap.xml', 'textarea', 0, 'The template for robots.txt file. Use {LANG} as a placeholder for the language code. This template will be used to generate the robots.txt file content.', NULL, 4, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('a565c718-24d7-40e0-a153-4154ef6cb152', 3, 'Translations', 'da_DK', '0', 'bool', 0, 'Enable translations in Danish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('a6ff99b1-6969-4f7e-8ac9-9c32845f6fbe', 25, 'Translations', 'uk_UA', '0', 'bool', 0, 'Enable translations in Ukrainian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('a7e60929-67a7-4bfb-890d-ad5e1d61bb59', 3, 'Security', 'blockOnNoIp', '1', 'bool', 0, 'Block requests when the client IP address cannot be determined. Recommended for production environments to prevent IP detection bypass.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('a9da9259-8b34-45f9-8dae-ad40ec10ace8', 7, 'AI', 'articleSummaries', '0', 'bool', 0, 'Automatically generate concise and compelling summaries for your articles and pages. When enabled, the system will analyze the content and create a brief synopsis that captures the key points. These summaries will appear on the article index page and other areas where a short overview is preferable to displaying the full text.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('abceedbc-d506-435b-a844-17bd00017d81', 0, 'Editing', 'editor', 'markdownit', 'select', 0, 'Chose your default editor for posts and pages content. Trumbowyg is good for HTML whilst Markdown-It supports Markdown.', '{\n  \"trumbowyg\": \"Trumbowyg\",\n  \"markdownit\": \"Markdown-It\"\n}', 2, '2025-07-22 04:18:37', '2025-07-21 23:42:13'),
('ac890fa1-f763-43f9-ab90-623b659c5172', 21, 'Security', 'suspiciousWindowHours', '24', 'numeric', 0, 'Time window in hours for counting suspicious requests.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('ac973094-2b66-4590-be8b-f96dc3cc8b9f', 4, 'Google', 'youtubeApiKey', 'your-api-key-here', 'text', 1, 'This field is used to store your YouTube API key, which is required to access your videos to insert into post and page content.', NULL, 12, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('b2510543-b36e-494e-aa5f-f203e7314d3f', 5, 'Google', 'youtubeChannelId', 'your-api-key-here', 'text', 1, 'This field is used to store your YouTube Channel ID, which is required to allow you to filter videos to just your own.', NULL, 12, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('b4e63e54-cb4a-4ac8-918e-094695157ba0', 12, 'RateLimit', 'adminNumberOfRequests', '40', 'numeric', 0, 'Maximum admin area requests allowed within the time window.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('b7fff8db-c5e8-486f-bba0-56a74b538204', 2, 'Comments', 'pagesEnabled', '1', 'bool', 0, 'Turn this on to enable logged in users to comment on your pages.', NULL, 2, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('b888da96-ef95-4205-9b62-f99840bb1b06', 4, 'ImageSizes', 'medium', '300', 'numeric', 0, 'The width for the medium image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('bb8f14fc-c7f9-41e2-ae45-30ef038e146d', 23, 'Translations', 'sv_SE', '0', 'bool', 0, 'Enable translations in Swedish', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('c2233a60-a0fd-4848-95ad-372f6e5ebbab', 2, 'SitePages', 'mainMenuShow', 'selected', 'select', 0, 'Should the main menu show all root pages or only selected pages?', '{\n  \"root\": \"Top Level Pages\",\n  \"selected\": \"Selected Pages\"\n}', 2, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('c787152b-c7d5-4afb-ab39-1f39c1c34b35', 20, 'Translations', 'ru_RU', '0', 'bool', 0, 'Enable translations in Russian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('c7b56ffa-79fb-4057-a1df-ddc50502c01a', 3, 'SitePages', 'mainTagMenuShow', 'selected', 'select', 0, 'Should the main tag menu show all root tags or only selected tags?', '{\n  \"root\": \"Top Level Tags\",\n  \"selected\": \"Selected Tags\"\n}', 2, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('ccc190a2-f2d4-46f1-8ed7-551a57d31a95', 6, 'AI', 'articleTags', '0', 'bool', 0, 'Automatically generate relevant tags for your articles and pages based on their content. When you save an article or page, the system will analyze the text and create tags that best represent the main topics and keywords. These tags will then be automatically linked to the corresponding article or page, making it easier for readers to find related content on your website.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('cd13b2df-b3de-46f2-a4e8-29a97abfcbbb', 2, 'RateLimit', 'numberOfRequests', '30', 'numeric', 0, 'The maximum number of requests allowed per minute for sensitive routes such as login and registration.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('cea59198-2b7f-4c8d-91c8-d65d192249fa', 2, 'Security', 'trustedProxies', ' ', 'textarea', 0, 'List of trusted proxy IP addresses (one per line). Only requests from these IPs will have their forwarded headers honored when trustProxy is enabled. Leave empty to trust all proxies (not recommended for production).', NULL, 6, '2025-07-22 04:18:37', '2025-07-21 23:32:00'),
('d1703f5f-a383-4ee1-876b-fc37311405e0', 1, 'Users', 'registrationEnabled', '1', 'bool', 0, 'Turn this on to enable users to register accounts on the site.', NULL, 2, '2025-07-22 04:18:37', '2025-07-21 23:31:49'),
('d201a4b2-82de-4dc7-94f4-4ea09cb92093', 1, 'Security', 'trustProxy', '0', 'bool', 0, 'Enable this setting if Willow CMS is deployed behind a proxy or load balancer that modifies request headers. When enabled, the application will trust the `X-Forwarded-For` and `X-Real-IP` headers to determine the original client IP address. Use this setting with caution, as it can expose Willow CMS to IP spoofing if untrusted proxies are allowed.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('d7893100-0092-4ef7-a88f-ec7bd506cd05', 1, 'ImageSizes', 'massive', '800', 'numeric', 0, 'The width for the massive image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e023547b-8bd1-4062-afac-d44396da868c', 1, 'Translations', 'bg_BG', '0', 'bool', 0, 'Enable translations in Bulgarian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e1bbb65b-103f-44a2-9eff-83967a9e865d', 16, 'Translations', 'no_NO', '0', 'bool', 0, 'Enable translations in Norwegian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e40a4e31-cdef-49f2-a0e0-d20d6c6a76b1', 11, 'RateLimit', 'loginNumberOfSeconds', '60', 'numeric', 0, 'Time window in seconds for login rate limiting.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e4a06173-8a2a-4b31-b72c-52465e030591', 0, 'i18n', 'provider', 'google', 'select', 0, 'This setting is used for updating the built-in translations for the Willow CMS interface. Options include Google or Anthropic, with Google generally providing better translations. For auto translation of your website content, see the Translations section to enable languages.', '{\n  \"google\": \"Google\",\n  \"anthropic\": \"Anthropic\"\n}', 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e6f05b3e-6ab2-4d40-b6f0-0a1506c2a942', 13, 'Translations', 'lt_LT', '0', 'bool', 0, 'Enable translations in Lithuanian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('e80ce0a3-187d-4aa1-b132-2ad0d3b48b5c', 3, 'ImageSizes', 'large', '400', 'numeric', 0, 'The width for the large image size.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('ea7e8db3-4579-4980-abad-85f52b7c836e', 9, 'Translations', 'fr_FR', '0', 'bool', 0, 'Enable translations in French', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('ec48ff3c-d763-460d-8884-f3bd39198b92', 22, 'Translations', 'sl_SI', '0', 'bool', 0, 'Enable translations in Slovenian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('f24e90f1-7de6-4888-9b5e-ce90d3b18c25', 14, 'RateLimit', 'passwordResetNumberOfRequests', '3', 'numeric', 0, 'Maximum password reset requests allowed within the time window.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('f271dcf8-46e0-479d-9f76-0d3e5df29f2b', 0, 'Email', 'reply_email', 'noreply@example.com', 'text', 0, 'The \"Reply Email\" field allows you to specify the email address that will be used as the \"Reply-To\" address for outgoing emails sent from Willow CMS. When a recipient receives an email from your website and chooses to reply to it, their response will be directed to the email address specified in this field.', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('f439e007-7cbf-4f2b-9ca7-8c7065739836', 22, 'Security', 'suspiciousBlockHours', '24', 'numeric', 0, 'How long to block IPs that exceed the suspicious request threshold (in hours).', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('fa52e2a5-cd01-46dc-8308-a9b4e8dbfa6c', 3, 'SEO', 'siteStrapline', 'Welcome to Adapter CMS', 'textarea', 0, 'The site strapline is a brief, catchy phrase or slogan that complements your site name. It provides additional context or a memorable tagline that encapsulates the essence of your website. This strapline is often displayed alongside the site name in headers or footers.', NULL, 4, '2025-07-22 04:18:37', '2025-07-21 23:32:47'),
('fbfb681b-d369-4f98-9413-7e435dfcf262', 19, 'Translations', 'ro_RO', '0', 'bool', 0, 'Enable translations in Romanian', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37'),
('fe143c2b-2c95-430e-9999-04916436b266', 18, 'Translations', 'pt_PT', '0', 'bool', 0, 'Enable translations in Portuguese', NULL, 2, '2025-07-22 04:18:37', '2025-07-22 04:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
CREATE TABLE `slugs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `model`, `foreign_key`, `slug`, `created`) VALUES
('024f50f8-f3d4-493b-a5ad-12eeb3403118', 'Tags', '3db7825a-58ca-47db-868f-c8e261851c3d', 'vzm-retyt', '2025-07-21 23:28:47'),
('11785503-4486-4ecb-b889-23aa57ca164f', 'Articles', 'd204158d-5523-4e45-b2b3-03c84b93ebe0', 'poohdha-xdtvkcf-cxdyowmk-nmcy-remgmvirgp-ytxv-tikmcjmu-smxqbyh-ehupqpvn-yey-ndg-pfkuekgij-pijenb-jln', '2025-07-21 23:28:47'),
('16e6280d-95c5-4db0-993b-23ccfab39102', 'Tags', 'e3243b04-64b5-4815-bd78-38b41f1b546a', 'sklqcy-qit', '2025-07-21 23:28:47'),
('1ce83ea6-036e-41d9-aa81-ff2a0ed72bd4', 'Articles', 'ce2c48cd-71dd-4af1-af80-d5b42c78b7d7', 'qynm-tkgyxm-fpphzsx-fyssnszssg-bqjlt-giiax-ljpskgt-ifayewxn-kwwzjlb-npkav-sgsrwyhce-cnrume-paouznap', '2025-07-21 23:28:47'),
('1df2498f-2911-4701-ad77-064a05fa8351', 'Tags', '8406a099-89b5-4b70-9f6c-6f9cab33b491', 'kjiyhhul-s', '2025-07-21 23:28:47'),
('2316bb16-7a55-4a6c-8cbf-7cae865690f6', 'Tags', '03dfd493-591a-4094-bc98-6c65979c92e0', 'etc', '2025-07-21 23:37:58'),
('2f957d32-749f-463d-9219-490df59bd7ce', 'Articles', 'e7333da2-fe92-48ff-bfc9-06ae20552c2b', 'wmbj-pknxak-kqusalpm-xhubp-rwwy-dktqloudgd-dbhvuk-nkykuohn-qqfpj-nvnay-spiyq-gup-xbwxeb-zwlabpyi-kig', '2025-07-21 23:28:47'),
('374f6113-9992-4c22-9056-108b7743f616', 'Tags', 'a41fe7b2-17a5-49e4-b04e-864ea1c1a39d', 'pmsxrh-wyn', '2025-07-21 23:28:47'),
('3e65e583-953a-4fb2-ba91-ad23806e56da', 'Articles', 'f9377e58-15d0-43b3-8a49-52f8308f4199', 'defuj-aaheejmo-gytdaqeneo-ucndwrg-zxdcjvfdg-gsrrvrbt-wgtapdh-omvb-pmgkpgg-ttwpvg-ohrxihte-nxz-kfa-ej', '2025-07-21 23:28:47'),
('43220964-a1a1-4376-9368-df2a3d1053cf', 'Tags', 'a05330d5-ebc2-42e9-a05b-43557d15ffcc', 'shvn-rnw-w', '2025-07-21 23:28:47'),
('69300311-c590-4166-a0a1-39069e426266', 'Articles', '219bca25-196f-4127-8349-5ac70cc87a73', 'vybwmlveic-qegroghx-egzfb-vurlayi-zuxcdrn-bynyauubxp-jnrz-hqmpxdjz-ifusbgms-lgeiiqabrx-ruvw-nuyrhwd', '2025-07-21 23:28:47'),
('6bad3c36-6fb7-486e-8879-c6f90bde3800', 'Tags', 'f57061b7-a016-4f80-92df-b7d322ce5c69', 'hbd-crg-gk', '2025-07-21 23:28:47'),
('6d0dcb28-91fa-4fea-abcf-e953cdae982b', 'Tags', '5b7370aa-3d24-4bda-85c3-f0b3b65537de', 'kdjikoud-f', '2025-07-21 23:28:47'),
('6fcac024-0e11-469c-8f39-0c1b3e264668', 'Articles', '361cd4aa-3dca-42d3-88c1-1f7d963ba512', 'tqlxpa-lat-ffxehpep-nunwo-pin-didtgj-vmnjfocec-qlvpxbkjz-mvp-qkxzgise-ptforoj-syhve-ddoyrfm-vrq-cyog', '2025-07-21 23:28:47'),
('7792ef1e-9040-45cb-b68e-1f517cc50210', 'Articles', '752eb10f-6ed7-4283-935b-acb5c9873f96', 'okwoor-udhgtv-ddxj-xkwrkboge-osse-uhn-qcnlnlnx-jsjw-wygug-zgrwjx-ldzenkwlb-tfmw-kcthuhft-akcor-pefi', '2025-07-21 23:28:47'),
('7f6f58ba-4521-4b35-bef0-8ac3f23f3c82', 'Articles', '87934799-4a2f-443a-a656-52aa68a9af47', 'sulgvzo-ptmhy-fvvvamgudh-picy-xdjwqoxtgc-srjf-ecjcmbcf-xshildzscv-odr-ekxhvapnw-tknvjeucno-dmepzkix', '2025-07-21 23:28:47'),
('84533090-c6da-4840-a0fc-deda782a4152', 'Tags', '83b9cb0c-5da5-415b-9949-39e3dbb7d8ec', 'xdlh-tmwn', '2025-07-21 23:28:47'),
('953b2dc0-16e4-41d7-8dc1-35224a9c60bf', 'Tags', 'c232e7fc-3c06-428f-bf30-4dd3e6307e96', 'type-c-adapter', '2025-07-21 23:37:18'),
('a11bce77-f128-4851-9eb0-9d97fcd9744b', 'Articles', '4061963d-b37d-41b7-9183-f94ce942684e', 'dds-szldrzgi-dzz-xqcu-ylitrdgo-ionz-rredq-kvn-seg-camqlykcm-xomgq-dfd-dqjtt-ozkdtbp-wyhbe-tkevy-tdfy', '2025-07-21 23:28:47'),
('a2283333-6eb8-4459-b97c-fc9e1805a7ac', 'Tags', 'de13c3dc-0fae-4093-8214-96a22eae2dcc', 'szlygep-jb', '2025-07-21 23:28:47'),
('a7154d48-3cd4-4edf-8aaf-119effa68d33', 'Tags', '909a203b-7205-4023-bf9f-8c419d044358', 'tcdxft-wqc', '2025-07-21 23:28:47'),
('e7cc6b9c-fed7-4588-9576-94eb7df44e8e', 'Articles', 'e72d2820-fa8b-44f3-ba7b-49febd56ef8e', 'zovn-jcnub-rcbw-qogejenj-ukjt-uosu-hyylxg-nxznuygrpu-ril-fmuvwdmski-urdddya-wavejenme-kkyiohisg-qozi', '2025-07-21 23:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

DROP TABLE IF EXISTS `system_logs`;
CREATE TABLE `system_logs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`id`, `level`, `message`, `context`, `created`, `group_name`) VALUES
('01d41dd7-1f83-4d32-9f15-7b28f1738d0b', 'warning', 'MissingTemplateException - Failed to render error template `badMethodCall` . Error: Template file `Error/bad_method_call.php` could not be found.\n\nThe following paths were searched:\n\n- `/var/www/html/plugins/DefaultTheme/templates/Error/bad_method_call.php`\n- `/var/www/html/templates/Error/bad_method_call.php`\n- `/var/www/html/vendor/cakephp/cakephp/templates/Error/bad_method_call.php`\n\nStack Trace\n: #0 /var/www/html/vendor/cakephp/cakephp/src/View/View.php(782): Cake\\View\\View->_getTemplateFileName(\'...\')\n#1 /var/www/html/vendor/cakephp/cakephp/src/Controller/Controller.php(712): Cake\\View\\View->render()\n#2 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(432): Cake\\Controller\\Controller->render(\'...\')\n#3 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(277): Cake\\Error\\Renderer\\WebExceptionRenderer->_outputMessage(\'...\')\n#4 /var/www/html/src/Error/AppExceptionRenderer.php(62): Cake\\Error\\Renderer\\WebExceptionRenderer->render()\n#5 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(149): App\\Error\\AppExceptionRenderer->render()\n#6 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(119): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->handleException(Object(BadMethodCallException), Object(Cake\\Http\\ServerRequest))\n#7 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#8 /var/www/html/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#9 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): DebugKit\\Middleware\\DebugKitMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#10 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#11 /var/www/html/vendor/cakephp/cakephp/src/Http/Server.php(104): Cake\\Http\\Runner->run(Object(Cake\\Http\\MiddlewareQueue), Object(Cake\\Http\\ServerRequest), Object(App\\Application))\n#12 /var/www/html/webroot/index.php(37): Cake\\Http\\Server->run()\n#13 {main}', '{\"scope\":[\"cake.error\"]}', '2025-07-21 23:35:17', 'general'),
('140587e0-ef7a-4226-bb1c-714a3990a031', 'info', 'Attempting to create user with data: {\"username\":\"admin\",\"confirm_password\":\"password\",\"email\":\"admin@test.com\",\"is_admin\":true,\"active\":1}', '{\"scope\":[\"user_management\",\"user_creation\"]}', '2025-07-21 23:18:37', 'general'),
('159cd203-c3f9-4acc-a6cb-d59aeead1c72', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:41:29', 'general'),
('1db31da9-a38d-4e72-9a62-494cde613591', 'error', '[Cake\\Datasource\\Exception\\InvalidPrimaryKeyException] Record not found in table `requests` with primary key `[NULL]`. in /var/www/html/vendor/cakephp/cakephp/src/ORM/Table.php on line 1514\nStack Trace:\n- ROOT/vendor/cakephp/debug_kit/src/Controller/RequestsController.php:60\n- CORE/src/Controller/Controller.php:505\n- CORE/src/Controller/ControllerFactory.php:166\n- CORE/src/Controller/ControllerFactory.php:141\n- CORE/src/Http/BaseApplication.php:362\n- CORE/src/Http/Runner.php:86\n- APP/Middleware/RateLimitMiddleware.php:148\n- CORE/src/Http/Runner.php:82\n- APP/Middleware/IpBlockerMiddleware.php:107\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/CsrfProtectionMiddleware.php:169\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/authentication/src/Middleware/AuthenticationMiddleware.php:106\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/BodyParserMiddleware.php:157\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/admad/cakephp-i18n/src/Middleware/I18nMiddleware.php:110\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/RoutingMiddleware.php:117\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/AssetMiddleware.php:70\n- CORE/src/Http/Runner.php:82\n- CORE/src/Error/Middleware/ErrorHandlerMiddleware.php:115\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php:60\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Runner.php:60\n- CORE/src/Http/Server.php:104\n- ROOT/webroot/index.php:37\n- [main]:\n\nRequest URL: /debug-kit/toolbar?q=/debug-kit/toolbar&\nClient IP: 151.101.115.52', '{\"scope\":[]}', '2025-07-21 23:28:04', 'general'),
('1fb0d514-0d40-40e5-b3b8-5191ac39e7b1', 'error', '[Cake\\Http\\Exception\\NotFoundException] Not Found in /var/www/html/vendor/cakephp/debug_kit/src/Controller/PanelsController.php on line 69\nStack Trace:\n- CORE/src/Controller/Controller.php:505\n- CORE/src/Controller/ControllerFactory.php:166\n- CORE/src/Controller/ControllerFactory.php:141\n- CORE/src/Http/BaseApplication.php:362\n- CORE/src/Http/Runner.php:86\n- APP/Middleware/RateLimitMiddleware.php:148\n- CORE/src/Http/Runner.php:82\n- APP/Middleware/IpBlockerMiddleware.php:107\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/CsrfProtectionMiddleware.php:169\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/authentication/src/Middleware/AuthenticationMiddleware.php:106\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/BodyParserMiddleware.php:157\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/admad/cakephp-i18n/src/Middleware/I18nMiddleware.php:110\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/RoutingMiddleware.php:117\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/AssetMiddleware.php:70\n- CORE/src/Http/Runner.php:82\n- CORE/src/Error/Middleware/ErrorHandlerMiddleware.php:115\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php:60\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Runner.php:60\n- CORE/src/Http/Server.php:104\n- ROOT/webroot/index.php:37\n- [main]:\n\nRequest URL: /debug-kit/panels/%2A?q=/debug-kit/panels/*&\nClient IP: 151.101.115.52', '{\"scope\":[]}', '2025-07-21 23:27:52', 'general'),
('2ceff9e1-d9af-4d21-9ea0-af9a60e40bab', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:38:28', 'general'),
('3db4f557-6e85-4417-a615-a8a8d4eb7f97', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 01:06:46', 'general'),
('40a3b29d-7ee7-4031-9111-85834c0c6d0d', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 01:16:49', 'general'),
('54936931-dc0b-419f-9108-3a5b797537bc', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:32:38', 'general'),
('6663e4c1-12c7-4cf3-b233-7008dfaf45d9', 'debug', 'Your migration status some differences with the expected state.\n\nMigrations needing to be reversed:\n- Migration to reverse. source=V1 id=20241128230315\n- Migration to reverse. source=ChangeExpiresAtToDatetime id=20241201193813\n- Migration to reverse. source=InsertSettings id=20241202164800\n- Migration to reverse. source=AddRobotsTemplate id=20241203215800\n- Migration to reverse. source=Newslugstable id=20241208194033\n- Migration to reverse. source=ArticleViews id=20241214165907\n- Migration to reverse. source=AddSecuritySettings id=20250523122807\n- Migration to reverse. source=AddRateLimitSettings id=20250523132600\n- Migration to reverse. source=CreateImageGalleries id=20250604074527\n- Migration to reverse. source=AddGalleryAiSettings id=20250605211400\n\nGoing to drop all tables in this source, and re-apply migrations.', '{\"scope\":[]}', '2025-07-21 23:18:45', 'general'),
('92a8341b-d6cf-4063-95ee-bff970fc5e5a', 'info', 'User created successfully: admin (ID: da264525-a966-4ad1-be81-307fd39c62eb)', '{\"scope\":[\"user_management\",\"user_creation\"]}', '2025-07-21 23:18:37', 'general'),
('93c32e87-d91c-4c10-af87-1fa5fa55ef11', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:40:52', 'general'),
('97bee3c1-77c3-418a-b0ac-6059eb0e7b10', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:50:53', 'general'),
('9d41023d-0925-4cee-8e7e-6d3028c697f6', 'warning', 'MissingTemplateException - Failed to render error template `typeError` . Error: Template file `Error/type_error.php` could not be found.\n\nThe following paths were searched:\n\n- `/var/www/html/plugins/DefaultTheme/templates/plugin/DebugKit/Error/type_error.php`\n- `/var/www/html/plugins/DefaultTheme/templates/Error/type_error.php`\n- `/var/www/html/templates/plugin/DebugKit/Error/type_error.php`\n- `/var/www/html/vendor/cakephp/debug_kit/templates/Error/type_error.php`\n- `/var/www/html/templates/Error/type_error.php`\n- `/var/www/html/vendor/cakephp/cakephp/templates/Error/type_error.php`\n\nStack Trace\n: #0 /var/www/html/vendor/cakephp/cakephp/src/View/View.php(782): Cake\\View\\View->_getTemplateFileName(\'...\')\n#1 /var/www/html/vendor/cakephp/cakephp/src/Controller/Controller.php(712): Cake\\View\\View->render()\n#2 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(432): Cake\\Controller\\Controller->render(\'...\')\n#3 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(277): Cake\\Error\\Renderer\\WebExceptionRenderer->_outputMessage(\'...\')\n#4 /var/www/html/src/Error/AppExceptionRenderer.php(62): Cake\\Error\\Renderer\\WebExceptionRenderer->render()\n#5 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(149): App\\Error\\AppExceptionRenderer->render()\n#6 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(119): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->handleException(Object(TypeError), Object(Cake\\Http\\ServerRequest))\n#7 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#8 /var/www/html/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#9 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): DebugKit\\Middleware\\DebugKitMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#10 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#11 /var/www/html/vendor/cakephp/cakephp/src/Http/Server.php(104): Cake\\Http\\Runner->run(Object(Cake\\Http\\MiddlewareQueue), Object(Cake\\Http\\ServerRequest), Object(App\\Application))\n#12 /var/www/html/webroot/index.php(37): Cake\\Http\\Server->run()\n#13 {main}', '{\"scope\":[\"cake.error\"]}', '2025-07-21 23:23:45', 'general'),
('a788203d-51c2-4808-a26e-86b096d88fce', 'warning', 'MissingTemplateException - Failed to render error template `invalidPrimaryKey` . Error: Template file `Error/invalid_primary_key.php` could not be found.\n\nThe following paths were searched:\n\n- `/var/www/html/plugins/DefaultTheme/templates/plugin/DebugKit/Error/invalid_primary_key.php`\n- `/var/www/html/plugins/DefaultTheme/templates/Error/invalid_primary_key.php`\n- `/var/www/html/templates/plugin/DebugKit/Error/invalid_primary_key.php`\n- `/var/www/html/vendor/cakephp/debug_kit/templates/Error/invalid_primary_key.php`\n- `/var/www/html/templates/Error/invalid_primary_key.php`\n- `/var/www/html/vendor/cakephp/cakephp/templates/Error/invalid_primary_key.php`\n\nStack Trace\n: #0 /var/www/html/vendor/cakephp/cakephp/src/View/View.php(782): Cake\\View\\View->_getTemplateFileName(\'...\')\n#1 /var/www/html/vendor/cakephp/cakephp/src/Controller/Controller.php(712): Cake\\View\\View->render()\n#2 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(432): Cake\\Controller\\Controller->render(\'...\')\n#3 /var/www/html/vendor/cakephp/cakephp/src/Error/Renderer/WebExceptionRenderer.php(277): Cake\\Error\\Renderer\\WebExceptionRenderer->_outputMessage(\'...\')\n#4 /var/www/html/src/Error/AppExceptionRenderer.php(62): Cake\\Error\\Renderer\\WebExceptionRenderer->render()\n#5 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(149): App\\Error\\AppExceptionRenderer->render()\n#6 /var/www/html/vendor/cakephp/cakephp/src/Error/Middleware/ErrorHandlerMiddleware.php(119): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->handleException(Object(Cake\\Datasource\\Exception\\InvalidPrimaryKeyException), Object(Cake\\Http\\ServerRequest))\n#7 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): Cake\\Error\\Middleware\\ErrorHandlerMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#8 /var/www/html/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#9 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(82): DebugKit\\Middleware\\DebugKitMiddleware->process(Object(Cake\\Http\\ServerRequest), Object(Cake\\Http\\Runner))\n#10 /var/www/html/vendor/cakephp/cakephp/src/Http/Runner.php(60): Cake\\Http\\Runner->handle(Object(Cake\\Http\\ServerRequest))\n#11 /var/www/html/vendor/cakephp/cakephp/src/Http/Server.php(104): Cake\\Http\\Runner->run(Object(Cake\\Http\\MiddlewareQueue), Object(Cake\\Http\\ServerRequest), Object(App\\Application))\n#12 /var/www/html/webroot/index.php(37): Cake\\Http\\Server->run()\n#13 {main}', '{\"scope\":[\"cake.error\"]}', '2025-07-21 23:28:04', 'general'),
('a9344bec-e809-4219-866d-e71a923fcfc1', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:42:19', 'general'),
('af343f70-a610-4859-a75e-cd431e1ee664', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:44:38', 'general'),
('b2486bcf-87da-4d67-94e3-e5aa9c1a2fc4', 'info', 'Received test job message: test-id : Test User Save Failure', '{\"group_name\":\"App\\\\Test\\\\TestCase\\\\Job\\\\TestableJob\",\"scope\":[]}', '2025-07-22 00:42:01', 'App\\Test\\TestCase\\Job\\TestableJob'),
('bcf0af2e-f19b-4be3-9e3b-a53324d06fee', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:18:45', 'general'),
('bda3d0c8-5a1a-4864-a80d-8cb6a050d1f4', 'error', 'test job failed. ID: test-id (Test User Save Failure) Error: Operation returned false or null', '{\"group_name\":\"App\\\\Test\\\\TestCase\\\\Job\\\\TestableJob\",\"scope\":[]}', '2025-07-22 00:42:01', 'App\\Test\\TestCase\\Job\\TestableJob'),
('c18201d3-ba9f-4640-8f22-14534040adc2', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:42:00', 'general'),
('c4a32810-9790-4090-9262-9dfc6c59e05b', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:31:06', 'general'),
('ca890492-1fb9-4088-9938-a5bdc0072ecd', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:46:15', 'general'),
('e1125f14-b4dd-4d59-8335-0a03e88a8b2b', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:47:19', 'general'),
('e84c762e-c9f9-439a-b344-5ebac9362fcf', 'error', '[TypeError] DebugKit\\Model\\Table\\PanelsTable::findByRequest(): Argument #2 ($requestId) must be of type string|int, null given, called in /var/www/html/vendor/cakephp/cakephp/src/ORM/Table.php on line 2745 in /var/www/html/vendor/cakephp/debug_kit/src/Model/Table/PanelsTable.php on line 57\nStack Trace:\n- CORE/src/ORM/Table.php:2745\n- CORE/src/ORM/Table.php:2645\n- CORE/src/ORM/Table.php:1279\n- ROOT/vendor/cakephp/debug_kit/src/Controller/PanelsController.php:66\n- CORE/src/Controller/Controller.php:505\n- CORE/src/Controller/ControllerFactory.php:166\n- CORE/src/Controller/ControllerFactory.php:141\n- CORE/src/Http/BaseApplication.php:362\n- CORE/src/Http/Runner.php:86\n- APP/Middleware/RateLimitMiddleware.php:148\n- CORE/src/Http/Runner.php:82\n- APP/Middleware/IpBlockerMiddleware.php:107\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/CsrfProtectionMiddleware.php:169\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/authentication/src/Middleware/AuthenticationMiddleware.php:106\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/BodyParserMiddleware.php:157\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/admad/cakephp-i18n/src/Middleware/I18nMiddleware.php:110\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/RoutingMiddleware.php:117\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/AssetMiddleware.php:70\n- CORE/src/Http/Runner.php:82\n- CORE/src/Error/Middleware/ErrorHandlerMiddleware.php:115\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php:60\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Runner.php:60\n- CORE/src/Http/Server.php:104\n- ROOT/webroot/index.php:37\n- [main]:\n\nRequest URL: /debug-kit/panels?q=/debug-kit/panels&\nClient IP: 151.101.115.52', '{\"scope\":[]}', '2025-07-21 23:23:45', 'general'),
('ee83f550-d9bf-40aa-b6e2-ec9a24db35c9', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:37:37', 'general'),
('f3d97599-594a-48c7-ad5e-782b977ac7e7', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-22 00:37:59', 'general'),
('fa5698f7-fe38-4b25-91bb-2d975fc855c9', 'debug', 'Reading migrations status for test...', '{\"scope\":[]}', '2025-07-21 23:52:45', 'general'),
('fc07316d-9f6f-42e4-af95-8c5c09c26e22', 'error', '[BadMethodCallException] Unknown method `log` called on `App\\Model\\Table\\UsersTable` in /var/www/html/vendor/cakephp/cakephp/src/ORM/Table.php on line 2829\nStack Trace:\n- APP/Model/Table/QueueableJobsTrait.php:33\n- APP/Model/Behavior/QueueableImageBehavior.php:167\n- CORE/src/Event/EventManager.php:330\n- CORE/src/Event/EventManager.php:314\n- CORE/src/Event/EventDispatcherTrait.php:88\n- CORE/src/ORM/Table.php:2108\n- CORE/src/ORM/Table.php:2074\n- CORE/src/ORM/Table.php:1962\n- CORE/src/ORM/Table.php:1587\n- CORE/src/Database/Connection.php:649\n- CORE/src/ORM/Table.php:1587\n- CORE/src/ORM/Table.php:1961\n- APP/Controller/UsersController.php:281\n- CORE/src/Controller/Controller.php:505\n- CORE/src/Controller/ControllerFactory.php:166\n- CORE/src/Controller/ControllerFactory.php:141\n- CORE/src/Http/BaseApplication.php:362\n- CORE/src/Http/Runner.php:86\n- APP/Middleware/RateLimitMiddleware.php:148\n- CORE/src/Http/Runner.php:82\n- APP/Middleware/IpBlockerMiddleware.php:107\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/CsrfProtectionMiddleware.php:169\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/authentication/src/Middleware/AuthenticationMiddleware.php:106\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Middleware/BodyParserMiddleware.php:162\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/admad/cakephp-i18n/src/Middleware/I18nMiddleware.php:110\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/RoutingMiddleware.php:117\n- CORE/src/Http/Runner.php:82\n- CORE/src/Routing/Middleware/AssetMiddleware.php:70\n- CORE/src/Http/Runner.php:82\n- CORE/src/Error/Middleware/ErrorHandlerMiddleware.php:115\n- CORE/src/Http/Runner.php:82\n- ROOT/vendor/cakephp/debug_kit/src/Middleware/DebugKitMiddleware.php:60\n- CORE/src/Http/Runner.php:82\n- CORE/src/Http/Runner.php:60\n- CORE/src/Http/Server.php:104\n- ROOT/webroot/index.php:37\n- [main]:\n\nRequest URL: /en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb?q=/en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb&q=/en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb&q=/en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb&\nReferer URL: http://localhost:8080/en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb?q=/en/users/edit/da264525-a966-4ad1-be81-307fd39c62eb&\nClient IP: 151.101.115.52', '{\"scope\":[]}', '2025-07-21 23:35:17', 'general');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_menu` tinyint(1) NOT NULL DEFAULT '0',
  `lft` int NOT NULL,
  `rght` int NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`, `description`, `image`, `dir`, `alt_text`, `keywords`, `size`, `mime`, `name`, `meta_title`, `meta_description`, `meta_keywords`, `facebook_description`, `linkedin_description`, `instagram_description`, `twitter_description`, `parent_id`, `main_menu`, `lft`, `rght`, `modified`, `created`) VALUES
('03dfd493-591a-4094-bc98-6c65979c92e0', 'etc', 'etc', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'etc', 'etc', '', '', '', '', '', NULL, 1, 3, 24, '2025-07-21 23:37:58', '2025-07-21 23:37:58'),
('3db7825a-58ca-47db-868f-c8e261851c3d', 'vzm retyt', 'vzm-retyt', 'zdggxkga kikgh bokcq vciv owocb jgzejhrrjy zdo puveaqh nftlsv gzpvw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 16, 17, '2025-07-21 23:38:47', '2025-07-21 23:28:47'),
('5b7370aa-3d24-4bda-85c3-f0b3b65537de', 'kdjikoud f', 'kdjikoud-f', 'wip eewdzvprg lbqnyet yqldi qsrwf ehavhccc bheweye qbmse aftv glpk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 18, 19, '2025-07-21 23:38:52', '2025-07-21 23:28:47'),
('83b9cb0c-5da5-415b-9949-39e3dbb7d8ec', 'xdlh tmwn', 'xdlh-tmwn', 'achzr degbsoqaaj jmoqckn xlqenys wvehjnguho celcgttidv oceqlahjxs ujx pud wuzpu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 12, 13, '2025-07-21 23:39:01', '2025-07-21 23:28:47'),
('8406a099-89b5-4b70-9f6c-6f9cab33b491', 'kjiyhhul s', 'kjiyhhul-s', 'dpostcccq izvk fdyu vsxne zppzjvw mrurptlrcw dylpmsqxw njpkxpfbyu jjgmq qofrta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 4, 5, '2025-07-21 23:39:23', '2025-07-21 23:28:47'),
('909a203b-7205-4023-bf9f-8c419d044358', 'tcdxft wqc', 'tcdxft-wqc', 'rmzbmnaj lcx kbvihl gnrrjgcui oisa mlnjhal rzpxjtdi ztlher lrplyy pdbv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 6, 7, '2025-07-21 23:39:11', '2025-07-21 23:28:47'),
('a05330d5-ebc2-42e9-a05b-43557d15ffcc', 'shvn rnw w', 'shvn-rnw-w', 'wwo zfieyt bfamottd ybfyutjb cbkm luidxlpg xlteichvl kqagi innowhsans jvai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 8, 9, '2025-07-21 23:39:07', '2025-07-21 23:28:47'),
('a41fe7b2-17a5-49e4-b04e-864ea1c1a39d', 'pmsxrh wyn', 'pmsxrh-wyn', 'yyzh fzpb famedz yfi ngstnc nsr twhpolqcd frhygy yzt urhbvnlmqr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 14, 15, '2025-07-21 23:38:54', '2025-07-21 23:28:47'),
('c232e7fc-3c06-428f-bf30-4dd3e6307e96', 'type c adapter', 'type-c-adapter', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'type c adapter', 'type c adapter articles', '', '', '', '', '', NULL, 1, 1, 2, '2025-07-21 23:38:34', '2025-07-21 23:37:18'),
('de13c3dc-0fae-4093-8214-96a22eae2dcc', 'szlygep jb', 'szlygep-jb', 'rccqbanok igurywpre vznm eflcteegc zzvuyywuke bnvvgwh zlwbf vjnpbn qka sgli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 20, 21, '2025-07-21 23:38:37', '2025-07-21 23:28:47'),
('e3243b04-64b5-4815-bd78-38b41f1b546a', 'sklqcy qit', 'sklqcy-qit', 'zyac bei nhomll xyxzthauag drkjfxr kegvatw waigd mndd rkwuafjie afdzhafdw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 22, 23, '2025-07-21 23:38:18', '2025-07-21 23:28:47'),
('f57061b7-a016-4f80-92df-b7d322ce5c69', 'hbd crg gk', 'hbd-crg-gk', 'ufsuv rnbhjw yzlireujzb oqpwalug fepycwy jomipd ilnp jjysoxpsiw iyxll mvszw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03dfd493-591a-4094-bc98-6c65979c92e0', 0, 10, 11, '2025-07-21 23:39:04', '2025-07-21 23:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
CREATE TABLE `tags_translations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instagram_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `is_admin`, `email`, `password`, `image`, `alt_text`, `keywords`, `name`, `dir`, `size`, `mime`, `created`, `modified`, `username`, `active`) VALUES
('0d36e936-4c59-4f6c-91c7-a124ebb88ae1', 0, 'robjects@protonmail.com', '$2y$10$aN1RnJxeAc6KFSahyvbSI.RLgTP1KzgjIE4E0lXXHpgsr9ftAtzGO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-21 23:40:58', '2025-07-21 23:40:58', 'robjects', 1),
('da264525-a966-4ad1-be81-307fd39c62eb', 1, 'admin@test.com', '$2y$10$i/KAG.eYPinLs12Q3Kix2.7fC.8z6jZ.aQcoXTgl858grhqQi5UJC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-21 23:18:37', '2025-07-21 23:18:37', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_account_confirmations`
--

DROP TABLE IF EXISTS `user_account_confirmations`;
CREATE TABLE `user_account_confirmations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aiprompts`
--
ALTER TABLE `aiprompts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`);

--
-- Indexes for table `articles_translations`
--
ALTER TABLE `articles_translations`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Indexes for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_consents`
--
ALTER TABLE `cookie_consents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session` (`session_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_galleries`
--
ALTER TABLE `image_galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `is_published` (`is_published`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `image_galleries_images`
--
ALTER TABLE `image_galleries_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_gallery_id` (`image_gallery_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `image_galleries_translations`
--
ALTER TABLE `image_galleries_translations`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `id` (`id`),
  ADD KEY `locale` (`locale`);

--
-- Indexes for table `internationalisations`
--
ALTER TABLE `internationalisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models_images`
--
ALTER TABLE `models_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_foreign_key` (`model`,`foreign_key`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `page_views`
--
ALTER TABLE `page_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_slugs_lookup` (`model`,`slug`),
  ADD KEY `idx_slugs_foreign` (`model`,`foreign_key`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account_confirmations`
--
ALTER TABLE `user_account_confirmations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `confirmation_code` (`confirmation_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
