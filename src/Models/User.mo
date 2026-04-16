/// The X User object.

import { type UserAffiliation; JSON = UserAffiliation } "./UserAffiliation";

import { type UserConnectionStatusInner; JSON = UserConnectionStatusInner } "./UserConnectionStatusInner";

import { type UserEntities; JSON = UserEntities } "./UserEntities";

import { type UserPublicMetrics; JSON = UserPublicMetrics } "./UserPublicMetrics";

import { type UserSubscriptionType; JSON = UserSubscriptionType } "./UserSubscriptionType";

import { type UserVerifiedType; JSON = UserVerifiedType } "./UserVerifiedType";

import { type UserWithheld; JSON = UserWithheld } "./UserWithheld";

// User.mo

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer User type
        public type JSON = {
            affiliation : ?UserAffiliation;
            connection_status : ?[UserConnectionStatusInner];
            created_at : ?Text;
            description : ?Text;
            entities : ?UserEntities;
            id : Text;
            location : ?Text;
            most_recent_tweet_id : ?Text;
            name : Text;
            pinned_tweet_id : ?Text;
            profile_banner_url : ?Text;
            profile_image_url : ?Text;
            protected : ?Bool;
            public_metrics : ?UserPublicMetrics;
            receives_your_dm : ?Bool;
            subscription_type : ?UserSubscriptionType.JSON;
            url : ?Text;
            username : Text;
            verified : ?Bool;
            verified_type : ?UserVerifiedType.JSON;
            withheld : ?UserWithheld.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : User) : JSON = { value with
            subscription_type = do ? { UserSubscriptionType.toJSON(value.subscription_type!) };
            verified_type = do ? { UserVerifiedType.toJSON(value.verified_type!) };
            withheld = do ? { UserWithheld.toJSON(value.withheld!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?User {
            ?{ json with
                subscription_type = do ? { UserSubscriptionType.fromJSON(json.subscription_type!)! };
                verified_type = do ? { UserVerifiedType.fromJSON(json.verified_type!)! };
                withheld = do ? { UserWithheld.fromJSON(json.withheld!)! };
            }
        };
    }
}
