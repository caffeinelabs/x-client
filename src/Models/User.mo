/// The X User object.

import { type UserAffiliation; JSON = UserAffiliation } "./UserAffiliation";

import { type UserConnectionStatusInner; JSON = UserConnectionStatusInner } "./UserConnectionStatusInner";

import { type UserEntities; JSON = UserEntities } "./UserEntities";

import { type UserPublicMetrics; JSON = UserPublicMetrics } "./UserPublicMetrics";

import { type UserSubscriptionType; JSON = UserSubscriptionType } "./UserSubscriptionType";

import { type UserVerifiedType; JSON = UserVerifiedType } "./UserVerifiedType";

import { type UserWithheld; JSON = UserWithheld } "./UserWithheld";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// User.mo

module {
    public type User = {
        affiliation : ?UserAffiliation;
        /// Returns detailed information about the relationship between two users.
        connection_status : ?[UserConnectionStatusInner];
        /// Creation time of this User.
        created_at : ?Text;
        /// The text of this User's profile description (also known as bio), if the User provided one.
        description : ?Text;
        entities : ?UserEntities;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
        /// The location specified in the User's profile, if the User provided one. As this is a freeform value, it may not indicate a valid location, but it may be fuzzily evaluated when performing searches with location queries.
        location : ?Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        most_recent_tweet_id : ?Text;
        /// The friendly name of this User, as shown on their profile.
        name : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        pinned_tweet_id : ?Text;
        /// The URL to the profile banner for this User.
        profile_banner_url : ?Text;
        /// The URL to the profile image for this User.
        profile_image_url : ?Text;
        /// Indicates if this User has chosen to protect their Posts (in other words, if this User's Posts are private).
        protected : ?Bool;
        public_metrics : ?UserPublicMetrics;
        /// Indicates if you can send a DM to this User
        receives_your_dm : ?Bool;
        subscription_type : ?UserSubscriptionType;
        /// The URL specified in the User's profile.
        url : ?Text;
        /// The X handle (screen name) of this user.
        username : Text;
        /// Indicate if this User is a verified X User.
        verified : ?Bool;
        verified_type : ?UserVerifiedType;
        withheld : ?UserWithheld;
    };

    public module JSON {
        public func toCandidValue(value : User) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.affiliation) {
                case (?v__) List.add(buf, ("affiliation", UserAffiliation.toCandidValue(v__)));
                case null ();
            };
            switch (value.connection_status) {
                case (?v__) List.add(buf, ("connection_status", #Array(Array.map<UserConnectionStatusInner, Candid.Candid>(v__, UserConnectionStatusInner.toCandidValue))));
                case null ();
            };
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            switch (value.entities) {
                case (?v__) List.add(buf, ("entities", UserEntities.toCandidValue(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.location) {
                case (?v__) List.add(buf, ("location", #Text(v__)));
                case null ();
            };
            switch (value.most_recent_tweet_id) {
                case (?v__) List.add(buf, ("most_recent_tweet_id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("name", #Text(value.name)));
            switch (value.pinned_tweet_id) {
                case (?v__) List.add(buf, ("pinned_tweet_id", #Text(v__)));
                case null ();
            };
            switch (value.profile_banner_url) {
                case (?v__) List.add(buf, ("profile_banner_url", #Text(v__)));
                case null ();
            };
            switch (value.profile_image_url) {
                case (?v__) List.add(buf, ("profile_image_url", #Text(v__)));
                case null ();
            };
            switch (value.protected) {
                case (?v__) List.add(buf, ("protected", #Bool(v__)));
                case null ();
            };
            switch (value.public_metrics) {
                case (?v__) List.add(buf, ("public_metrics", UserPublicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.receives_your_dm) {
                case (?v__) List.add(buf, ("receives_your_dm", #Bool(v__)));
                case null ();
            };
            switch (value.subscription_type) {
                case (?v__) List.add(buf, ("subscription_type", UserSubscriptionType.toCandidValue(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", #Text(v__)));
                case null ();
            };
            List.add(buf, ("username", #Text(value.username)));
            switch (value.verified) {
                case (?v__) List.add(buf, ("verified", #Bool(v__)));
                case null ();
            };
            switch (value.verified_type) {
                case (?v__) List.add(buf, ("verified_type", UserVerifiedType.toCandidValue(v__)));
                case null ();
            };
            switch (value.withheld) {
                case (?v__) List.add(buf, ("withheld", UserWithheld.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?User =
            switch (candid) {
                case (#Record(fields)) {
                    let affiliation : ?UserAffiliation = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "affiliation")) {
                        case (?affiliation_field) (UserAffiliation.fromCandidValue(affiliation_field.1));
                        case null null;
                    };
                    let connection_status : ?[UserConnectionStatusInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "connection_status")) {
                        case (?connection_status_field) ((switch (connection_status_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UserConnectionStatusInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = UserConnectionStatusInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let entities : ?UserEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entities")) {
                        case (?entities_field) (UserEntities.fromCandidValue(entities_field.1));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let location : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "location")) {
                        case (?location_field) ((switch (location_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let most_recent_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "most_recent_tweet_id")) {
                        case (?most_recent_tweet_id_field) ((switch (most_recent_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let pinned_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "pinned_tweet_id")) {
                        case (?pinned_tweet_id_field) ((switch (pinned_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let profile_banner_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "profile_banner_url")) {
                        case (?profile_banner_url_field) ((switch (profile_banner_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let profile_image_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "profile_image_url")) {
                        case (?profile_image_url_field) ((switch (profile_image_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let protected : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "protected")) {
                        case (?protected_field) ((switch (protected_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let public_metrics : ?UserPublicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_metrics")) {
                        case (?public_metrics_field) (UserPublicMetrics.fromCandidValue(public_metrics_field.1));
                        case null null;
                    };
                    let receives_your_dm : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "receives_your_dm")) {
                        case (?receives_your_dm_field) ((switch (receives_your_dm_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let subscription_type : ?UserSubscriptionType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscription_type")) {
                        case (?subscription_type_field) (UserSubscriptionType.fromCandidValue(subscription_type_field.1));
                        case null null;
                    };
                    let url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) ((switch (url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?username_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "username") else return null;
                    let ?username = ((switch (username_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let verified : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "verified")) {
                        case (?verified_field) ((switch (verified_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let verified_type : ?UserVerifiedType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "verified_type")) {
                        case (?verified_type_field) (UserVerifiedType.fromCandidValue(verified_type_field.1));
                        case null null;
                    };
                    let withheld : ?UserWithheld = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "withheld")) {
                        case (?withheld_field) (UserWithheld.fromCandidValue(withheld_field.1));
                        case null null;
                    };
                    ?{
                        affiliation;
                        connection_status;
                        created_at;
                        description;
                        entities;
                        id;
                        location;
                        most_recent_tweet_id;
                        name;
                        pinned_tweet_id;
                        profile_banner_url;
                        profile_image_url;
                        protected;
                        public_metrics;
                        receives_your_dm;
                        subscription_type;
                        url;
                        username;
                        verified;
                        verified_type;
                        withheld;
                    };
                };
                case _ null;
            };
    };
};
