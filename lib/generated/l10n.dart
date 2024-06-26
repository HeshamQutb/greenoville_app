// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `GreeNoville`
  String get appName {
    return Intl.message(
      'GreeNoville',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get location {
    return Intl.message(
      'Luxor',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Sunny`
  String get weather {
    return Intl.message(
      'Sunny',
      name: 'weather',
      desc: '',
      args: [],
    );
  }

  /// `Learn Tips`
  String get quickActionLearnTips {
    return Intl.message(
      'Learn Tips',
      name: 'quickActionLearnTips',
      desc: '',
      args: [],
    );
  }

  /// `Ask Expert`
  String get quickActionAskExpert {
    return Intl.message(
      'Ask Expert',
      name: 'quickActionAskExpert',
      desc: '',
      args: [],
    );
  }

  /// `Sell Produce`
  String get quickActionSellProduce {
    return Intl.message(
      'Sell Produce',
      name: 'quickActionSellProduce',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get latestNews {
    return Intl.message(
      'Latest News',
      name: 'latestNews',
      desc: '',
      args: [],
    );
  }

  /// `News Page`
  String get newsPage {
    return Intl.message(
      'News Page',
      name: 'newsPage',
      desc: '',
      args: [],
    );
  }

  /// `Market Prices`
  String get marketPrices {
    return Intl.message(
      'Market Prices',
      name: 'marketPrices',
      desc: '',
      args: [],
    );
  }

  /// `Soils`
  String get soilsTitle {
    return Intl.message(
      'Soils',
      name: 'soilsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get communityTitle {
    return Intl.message(
      'Community',
      name: 'communityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Learn`
  String get learnTitle {
    return Intl.message(
      'Learn',
      name: 'learnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get marketTitle {
    return Intl.message(
      'Market',
      name: 'marketTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `No News Available`
  String get noNewsAvailable {
    return Intl.message(
      'No News Available',
      name: 'noNewsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `ClaySoil`
  String get claySoil {
    return Intl.message(
      'ClaySoil',
      name: 'claySoil',
      desc: '',
      args: [],
    );
  }

  /// `SandySoil`
  String get sandySoil {
    return Intl.message(
      'SandySoil',
      name: 'sandySoil',
      desc: '',
      args: [],
    );
  }

  /// `SiltySoil`
  String get siltySoil {
    return Intl.message(
      'SiltySoil',
      name: 'siltySoil',
      desc: '',
      args: [],
    );
  }

  /// `LoamSoil`
  String get loamSoil {
    return Intl.message(
      'LoamSoil',
      name: 'loamSoil',
      desc: '',
      args: [],
    );
  }

  /// `Plants`
  String get plants {
    return Intl.message(
      'Plants',
      name: 'plants',
      desc: '',
      args: [],
    );
  }

  /// `Tips`
  String get tips {
    return Intl.message(
      'Tips',
      name: 'tips',
      desc: '',
      args: [],
    );
  }

  /// `Tools`
  String get tools {
    return Intl.message(
      'Tools',
      name: 'tools',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizers`
  String get fertilizers {
    return Intl.message(
      'Fertilizers',
      name: 'fertilizers',
      desc: '',
      args: [],
    );
  }

  /// `No result found with the name`
  String get noResultFound {
    return Intl.message(
      'No result found with the name',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Search now`
  String get searchNow {
    return Intl.message(
      'Search now',
      name: 'searchNow',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPost {
    return Intl.message(
      'Add Post',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get expandText {
    return Intl.message(
      'Read more',
      name: 'expandText',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get collapseText {
    return Intl.message(
      'Show less',
      name: 'collapseText',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get itsPost {
    return Intl.message(
      'Post',
      name: 'itsPost',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Replay`
  String get replay {
    return Intl.message(
      'Replay',
      name: 'replay',
      desc: '',
      args: [],
    );
  }

  /// `Replies`
  String get replies {
    return Intl.message(
      'Replies',
      name: 'replies',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `write a comment...`
  String get writeAComment {
    return Intl.message(
      'write a comment...',
      name: 'writeAComment',
      desc: '',
      args: [],
    );
  }

  /// `write a replay...`
  String get writeAReplay {
    return Intl.message(
      'write a replay...',
      name: 'writeAReplay',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To`
  String get welcomeTo {
    return Intl.message(
      'Welcome To',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Empower Your Harvest, Empower Your Future`
  String get onBoardingText {
    return Intl.message(
      'Empower Your Harvest, Empower Your Future',
      name: 'onBoardingText',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Login`
  String get successfullyLogin {
    return Intl.message(
      'Successfully Login',
      name: 'successfullyLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email and Password`
  String get enterEmailPassword {
    return Intl.message(
      'Enter Your Email and Password',
      name: 'enterEmailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Email Address`
  String get pleaseEnterEmailAddress {
    return Intl.message(
      'Please Enter Email Address',
      name: 'pleaseEnterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account!`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account!',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `sign up`
  String get signUp {
    return Intl.message(
      'sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Successfully`
  String get signUpSuccessfully {
    return Intl.message(
      'Sign Up Successfully',
      name: 'signUpSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message(
      'New Account',
      name: 'newAccount',
      desc: '',
      args: [],
    );
  }

  /// `Join GreeNoville Community`
  String get joinGreeNovilleCommunity {
    return Intl.message(
      'Join GreeNoville Community',
      name: 'joinGreeNovilleCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Discover Sustainable Farming Practices`
  String get farmingPractices {
    return Intl.message(
      'Discover Sustainable Farming Practices',
      name: 'farmingPractices',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get takePhoto {
    return Intl.message(
      'Take a photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Remove Image`
  String get removeImage {
    return Intl.message(
      'Remove Image',
      name: 'removeImage',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Phone Number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please Enter Phone Number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `have an account !`
  String get haveAccount {
    return Intl.message(
      'have an account !',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Farmer`
  String get farmer {
    return Intl.message(
      'Farmer',
      name: 'farmer',
      desc: '',
      args: [],
    );
  }

  /// `Expert`
  String get expert {
    return Intl.message(
      'Expert',
      name: 'expert',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Address`
  String get myAddress {
    return Intl.message(
      'My Address',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Security`
  String get privacySecurity {
    return Intl.message(
      'Privacy & Security',
      name: 'privacySecurity',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `what is your mind,?`
  String get whatIsYourMind {
    return Intl.message(
      'what is your mind,?',
      name: 'whatIsYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Post`
  String get successfullyPost {
    return Intl.message(
      'Successfully Post',
      name: 'successfullyPost',
      desc: '',
      args: [],
    );
  }

  /// `Cropper`
  String get cropper {
    return Intl.message(
      'Cropper',
      name: 'cropper',
      desc: '',
      args: [],
    );
  }

  /// `No thing to share!`
  String get noThing {
    return Intl.message(
      'No thing to share!',
      name: 'noThing',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password.`
  String get wrongPasswordEmail {
    return Intl.message(
      'Invalid email or password.',
      name: 'wrongPasswordEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email address is not registered.`
  String get userNotFound {
    return Intl.message(
      'Email address is not registered.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been disabled. Please contact support.`
  String get userDisabled {
    return Intl.message(
      'Your account has been disabled. Please contact support.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed. Please try again later.`
  String get defaultSignInFailed {
    return Intl.message(
      'Authentication failed. Please try again later.',
      name: 'defaultSignInFailed',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get invalidEmail {
    return Intl.message(
      'The email address is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failed. Please try again later.`
  String get defaultSignUpFailed {
    return Intl.message(
      'Sign up failed. Please try again later.',
      name: 'defaultSignUpFailed',
      desc: '',
      args: [],
    );
  }

  /// `No posts available.`
  String get noPostsAvailable {
    return Intl.message(
      'No posts available.',
      name: 'noPostsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Error:`
  String get error {
    return Intl.message(
      'Error:',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No comments yet.`
  String get noComments {
    return Intl.message(
      'No comments yet.',
      name: 'noComments',
      desc: '',
      args: [],
    );
  }

  /// `No replies yet.`
  String get noReplies {
    return Intl.message(
      'No replies yet.',
      name: 'noReplies',
      desc: '',
      args: [],
    );
  }

  /// `No likes yet.`
  String get noLikes {
    return Intl.message(
      'No likes yet.',
      name: 'noLikes',
      desc: '',
      args: [],
    );
  }

  /// `People Who Reacted`
  String get peopleWhoReacted {
    return Intl.message(
      'People Who Reacted',
      name: 'peopleWhoReacted',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Info`
  String get productInfo {
    return Intl.message(
      'Product Info',
      name: 'productInfo',
      desc: '',
      args: [],
    );
  }

  /// `Product Image`
  String get productImage {
    return Intl.message(
      'Product Image',
      name: 'productImage',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter ProductName`
  String get pleaseEnterProductName {
    return Intl.message(
      'Please Enter ProductName',
      name: 'pleaseEnterProductName',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get productPrice {
    return Intl.message(
      'Product Price',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Product Price`
  String get pleaseEnterProductPrice {
    return Intl.message(
      'Please Enter Product Price',
      name: 'pleaseEnterProductPrice',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get kg {
    return Intl.message(
      'Kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Ton`
  String get ton {
    return Intl.message(
      'Ton',
      name: 'ton',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get productQuantity {
    return Intl.message(
      'Quantity',
      name: 'productQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `E£`
  String get pound {
    return Intl.message(
      'E£',
      name: 'pound',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get noDescriptionAvailable {
    return Intl.message(
      'No description available',
      name: 'noDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Add Another Product`
  String get addAnotherProduct {
    return Intl.message(
      'Add Another Product',
      name: 'addAnotherProduct',
      desc: '',
      args: [],
    );
  }

  /// `Add Products`
  String get addProducts {
    return Intl.message(
      'Add Products',
      name: 'addProducts',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill All Fields`
  String get pleaseFillAllFields {
    return Intl.message(
      'Please Fill All Fields',
      name: 'pleaseFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Add Product`
  String get successfullyAddProduct {
    return Intl.message(
      'Successfully Add Product',
      name: 'successfullyAddProduct',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Create Farm`
  String get successfullyCreateFarm {
    return Intl.message(
      'Successfully Create Farm',
      name: 'successfullyCreateFarm',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Edit Farm`
  String get successfullyEditFarm {
    return Intl.message(
      'Successfully Edit Farm',
      name: 'successfullyEditFarm',
      desc: '',
      args: [],
    );
  }

  /// `Create Farm`
  String get createFarm {
    return Intl.message(
      'Create Farm',
      name: 'createFarm',
      desc: '',
      args: [],
    );
  }

  /// `Farm Name`
  String get farmName {
    return Intl.message(
      'Farm Name',
      name: 'farmName',
      desc: '',
      args: [],
    );
  }

  /// `Owner Name`
  String get ownerName {
    return Intl.message(
      'Owner Name',
      name: 'ownerName',
      desc: '',
      args: [],
    );
  }

  /// `Farm Location`
  String get farmLocation {
    return Intl.message(
      'Farm Location',
      name: 'farmLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Farm Name`
  String get pleaseEnterFarmName {
    return Intl.message(
      'Please Enter Farm Name',
      name: 'pleaseEnterFarmName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Owner Name`
  String get pleaseEnterOwnerName {
    return Intl.message(
      'Please Enter Owner Name',
      name: 'pleaseEnterOwnerName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Farm Location`
  String get pleaseEnterFarmLocation {
    return Intl.message(
      'Please Enter Farm Location',
      name: 'pleaseEnterFarmLocation',
      desc: '',
      args: [],
    );
  }

  /// `No products available.`
  String get noProductsAvailable {
    return Intl.message(
      'No products available.',
      name: 'noProductsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No Farms Available`
  String get noFarmsAvailable {
    return Intl.message(
      'No Farms Available',
      name: 'noFarmsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `chat-Bot`
  String get chatBot {
    return Intl.message(
      'chat-Bot',
      name: 'chatBot',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get sendMessage {
    return Intl.message(
      'Send Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Message`
  String get pleaseEnterValidMessage {
    return Intl.message(
      'Please Enter Valid Message',
      name: 'pleaseEnterValidMessage',
      desc: '',
      args: [],
    );
  }

  /// `No chat participants found.`
  String get noChatParticipantsFound {
    return Intl.message(
      'No chat participants found.',
      name: 'noChatParticipantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Farm`
  String get farm {
    return Intl.message(
      'Farm',
      name: 'farm',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit Farm`
  String get editFarm {
    return Intl.message(
      'Edit Farm',
      name: 'editFarm',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Edit Profile`
  String get successfullyEditProfile {
    return Intl.message(
      'Successfully Edit Profile',
      name: 'successfullyEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `You don\'t have a farm create one and share your products`
  String get doNotHaveAFarm {
    return Intl.message(
      'You don\\\'t have a farm create one and share your products',
      name: 'doNotHaveAFarm',
      desc: '',
      args: [],
    );
  }

  /// `No Plants`
  String get noPlants {
    return Intl.message(
      'No Plants',
      name: 'noPlants',
      desc: '',
      args: [],
    );
  }

  /// `No Tools`
  String get noTools {
    return Intl.message(
      'No Tools',
      name: 'noTools',
      desc: '',
      args: [],
    );
  }

  /// `No Fertilizers`
  String get noFertilizers {
    return Intl.message(
      'No Fertilizers',
      name: 'noFertilizers',
      desc: '',
      args: [],
    );
  }

  /// `Plant Info`
  String get plantInfo {
    return Intl.message(
      'Plant Info',
      name: 'plantInfo',
      desc: '',
      args: [],
    );
  }

  /// `Plant Name`
  String get plantName {
    return Intl.message(
      'Plant Name',
      name: 'plantName',
      desc: '',
      args: [],
    );
  }

  /// `Plant Description`
  String get plantDescription {
    return Intl.message(
      'Plant Description',
      name: 'plantDescription',
      desc: '',
      args: [],
    );
  }

  /// `Plant Usage`
  String get plantUsage {
    return Intl.message(
      'Plant Usage',
      name: 'plantUsage',
      desc: '',
      args: [],
    );
  }

  /// `Tool Info`
  String get toolInfo {
    return Intl.message(
      'Tool Info',
      name: 'toolInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tool Name`
  String get toolName {
    return Intl.message(
      'Tool Name',
      name: 'toolName',
      desc: '',
      args: [],
    );
  }

  /// `Tool Description`
  String get toolDescription {
    return Intl.message(
      'Tool Description',
      name: 'toolDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tool Usage`
  String get toolUsage {
    return Intl.message(
      'Tool Usage',
      name: 'toolUsage',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Info`
  String get fertilizerInfo {
    return Intl.message(
      'Fertilizer Info',
      name: 'fertilizerInfo',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Name`
  String get fertilizerName {
    return Intl.message(
      'Fertilizer Name',
      name: 'fertilizerName',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Description`
  String get fertilizerDescription {
    return Intl.message(
      'Fertilizer Description',
      name: 'fertilizerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Fertilizer Usage`
  String get fertilizerUsage {
    return Intl.message(
      'Fertilizer Usage',
      name: 'fertilizerUsage',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPost {
    return Intl.message(
      'Edit Post',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message(
      'Delete Post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Edit Post`
  String get successfullyEditPost {
    return Intl.message(
      'Successfully Edit Post',
      name: 'successfullyEditPost',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Delete Post`
  String get successfullyDeletePost {
    return Intl.message(
      'Successfully Delete Post',
      name: 'successfullyDeletePost',
      desc: '',
      args: [],
    );
  }

  /// `Add Tips`
  String get addTips {
    return Intl.message(
      'Add Tips',
      name: 'addTips',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any tips yet. Create and share your valuable tips with the community!`
  String get doNotHaveTips {
    return Intl.message(
      'You don\'t have any tips yet. Create and share your valuable tips with the community!',
      name: 'doNotHaveTips',
      desc: '',
      args: [],
    );
  }

  /// `Featured Articles and Tutorials`
  String get featuredArticles {
    return Intl.message(
      'Featured Articles and Tutorials',
      name: 'featuredArticles',
      desc: '',
      args: [],
    );
  }

  /// `Video Tutorials`
  String get videoTutorials {
    return Intl.message(
      'Video Tutorials',
      name: 'videoTutorials',
      desc: '',
      args: [],
    );
  }

  /// `Expert Insights and Tips`
  String get expertInsights {
    return Intl.message(
      'Expert Insights and Tips',
      name: 'expertInsights',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
