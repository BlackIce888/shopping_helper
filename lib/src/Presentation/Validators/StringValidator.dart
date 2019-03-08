/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

class StringValidator {

    static Function(String) builder({
        List<StringValidatorRules> rules,
        StringValidatorOptions options,
    })
    {
        return (String value) {
            if (rules == null) {
                return null;
            }
            if (options == null) {
                options = StringValidatorOptions();
            }

            String errorMsg;

            for (StringValidatorRules rule in rules) {
                switch (rule) {
                    case StringValidatorRules.required:
                        errorMsg = _validateRequired(value, options);
                        break;
                    case StringValidatorRules.length:
                        errorMsg = _validateLength(value, options);
                        break;
                    case StringValidatorRules.email:
                        errorMsg = _validateEmail(value, options);
                        break;
                }
                if (errorMsg != null) {
                    return errorMsg;
                }
            }
            return null;
        };
    }

    static Function(String) required() {
        return (String value) {
            return _validateRequired(value, StringValidatorOptions());
        };
    }

    static Function(String) length([int _minLength, int _maxLength]) {
        return (String value) {
            return _validateLength(value, StringValidatorOptions(
                minLength: _minLength, maxLength: _maxLength));
        };
    }

    static Function(String) email([RegExp _emailFormat]) {
        return (String value) {
            return _validateEmail(
                value, StringValidatorOptions(emailFormat: _emailFormat));
        };
    }

    static String _validateRequired(String value,
        StringValidatorOptions options) {
        if (value.isEmpty) {
            return options.requiredErrorMsg;
        }
        return null;
    }

    static String _validateLength(String value,
        StringValidatorOptions options) {
        if (options.minLength != null && options.minLength >= 0) {
            if (value.length < options.minLength) {
                return options.minLengthErrorMsg;
            }
        }
        if (options.maxLength != null && !options.maxLength.isNegative) {
            if (value.length > options.maxLength) {
                return options.maxLengthErrorMsg;
            }
        }
        return null;
    }

    static String _validateEmail(String value, StringValidatorOptions options) {
        RegExp emailFormat = options._defaultEmailFormat;
        if (options.emailFormat != null) {
            emailFormat = options.emailFormat;
        }
        if (!emailFormat.hasMatch(value)) {
            return options.emailFormatErrorMsg;
        }
        return null;
    }
}

class StringValidatorOptions {
    final int minLength;
    final int maxLength;
    final RegExp _defaultEmailFormat = RegExp(r"(\w+\@\w+(\.[a-z]{2,10})+)");
    final RegExp emailFormat;
    final String requiredErrorMsg;
    final String minLengthErrorMsg;
    final String maxLengthErrorMsg;
    final String emailFormatErrorMsg;

    StringValidatorOptions({
        this.minLength = 3,
        this.maxLength = 20,
        this.emailFormat,
        this.requiredErrorMsg = 'Please enter some text',
        this.minLengthErrorMsg = 'Input is too short',
        this.maxLengthErrorMsg = 'Input exceeds allowed length',
        this.emailFormatErrorMsg = 'Invalid e-mail adress',
    });
}

enum StringValidatorRules {
    required,
    length,
    email
}
