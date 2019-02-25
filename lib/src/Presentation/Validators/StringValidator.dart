/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

class StringValidator {

    static Function(String) required() {
        return (String value) {
            if (value.isEmpty) {
                return 'Please enter some text';
            }
        };
    }

    static Function(String) length({int minLength = 5, int maxLength}) {
        return (String value) {
            if (minLength != null && minLength >= 0) {
                if (value.length > minLength) {
                    return 'Input is too short';
                }
            }
            if (maxLength != null && !maxLength.isNegative) {
                if (value.length > maxLength) {
                    return 'Input exceeds allowed length';
                }
            }
        };
    }
    
    static Function(String) email() {
        return (String value) {
            RegExp exp = new RegExp(r"(\w+\@\w+(\.[a-z]{2,10})+)");
            if (!exp.hasMatch(value)) {
                return 'Invalid e-mail adress';
            }
        };
    }

}
