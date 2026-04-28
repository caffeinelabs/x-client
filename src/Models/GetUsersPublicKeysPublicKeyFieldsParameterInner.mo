import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetUsersPublicKeysPublicKeyFieldsParameterInner.mo
/// Enum values: #juicebox_config, #public_key, #signing_public_key, #version

module {
    public type GetUsersPublicKeysPublicKeyFieldsParameterInner = {
        #juicebox_config;
        #public_key;
        #signing_public_key;
        #version;
    };

    public module JSON {
        public func toCandidValue(value : GetUsersPublicKeysPublicKeyFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#juicebox_config) #Text("juicebox_config");
                case (#public_key) #Text("public_key");
                case (#signing_public_key) #Text("signing_public_key");
                case (#version) #Text("version");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetUsersPublicKeysPublicKeyFieldsParameterInner =
            switch (candid) {
                case (#Text("juicebox_config")) ?#juicebox_config;
                case (#Text("public_key")) ?#public_key;
                case (#Text("signing_public_key")) ?#signing_public_key;
                case (#Text("version")) ?#version;
                case _ null;
            };

        public func toText(value : GetUsersPublicKeysPublicKeyFieldsParameterInner) : Text =
            switch (value) {
                case (#juicebox_config) "juicebox_config";
                case (#public_key) "public_key";
                case (#signing_public_key) "signing_public_key";
                case (#version) "version";
            };
    };
};
