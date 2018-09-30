��    %      D  5   l      @  �   A    �  �     �   �  �   ]  �   >  �   �  �   �  �   �	  �   e
    7  �   V  r    �  �  �     x   �  .  4  a  c  6   �  5   �  6   2  9   i  7   �  6   �        +  �   8  �    �   �  &  �  H  �     .   l   K   -   �   2   �   G   !  r  a!  �   �"  ]  �#  �   �$  �   �%    �&  �   �'    =(    T)  �   n*  �   E+  o  8,  �   �-  �  �.    h0  �   }2  �   +3  m  �3  �  5  6   8  8   I8  6   �8  8   �8  6   �8  7   )9  E  a9  6  �:  �   �;  9  �<  5  ?  �  H@  �  �B      }E  v   �E  /   F  4   EF  O   zF                                                            !          
                     $            #   "       %                                           	                       
        Assigns the provided pre-trained scikit-learn model to be able to conjugate unknown verbs.

        :param model: scikit-learn Classifier or Pipeline.

         
        Gets conjugation information corresponding to the given template.

        :param template: string.
            Name of the verb ending pattern.
        :return: OrderedDict or None.
            OrderedDict containing the conjugated suffixes of the template.

         
        Gets verb information and returns a VerbInfo instance.

        :param verb: string.
            Verb to conjugate.
        :return: VerbInfo object or None.

         
        Load and parses the conjugations from xml file.

        :param conjugations_file: string or path object.
            Path to the conjugation xml file.

         
        Load and parses the inflected forms of the tense from xml file.

        :param tense: string.
            The current tense being processed.
        :return: list.
            List of conjugated suffixes.

         
        Load and parses the verbs from xml file.

        :param verbs_file: string or path object.
            Path to the verbs xml file.

         
        Parses XML file

        :param file: FileObject.
            XML file containing the conjugation templates
        :return: OrderedDict.
            An OrderedDict containing all the conjugation templates in the file.

         
        Parses XML file

        :param file: FileObject.
            XML file containing the verbs.
        :return: OrderedDict.
            An OrderedDict containing the verb and its template for all verbs in the file.

         
        Parses a verb and returns the ending ngrams.

        :param verb: string.
            Verb to vectorize.
        :return: list.
            Final ngrams of the verb.
         
        Predicts the conjugation class of the provided list of verbs.

        :param verbs: list.
            List of verbs.
        :return: list.
            List of predicted conjugation groups.

         
        Splits the data into a training and a testing set.

        :param threshold: int.
            Minimum size of conjugation class to be split.
        :param proportion: float.
            Proportion of samples in the training set.
            Must be between 0 and 1.

         
        Trains the model on the supplied samples and labels.

        :param samples: list.
            List of verbs.
        :param labels: list.
            List of verb templates.

         
        | Checks if the verb is a valid verb in the given language.
        | English words are always treated as possible verbs.
        | Verbs in other languages are filtered by their endings.

        :param verb: string.
            The verb conjugate.
        :return: bool.
            True if the verb is a valid verb in the language. False otherwise.

         
        | Detects the allowed endings for verbs in the supported languages.
        | All the supported languages except for English restrict the form a verb can take.
        | As English is much more productive and varied in the morphology of its verbs, any word is allowed as a verb.

        :return: set.
            A set containing the allowed endings of verbs in the target language.

         
        | Populates the dictionary containing the conjugation templates.
        | Populates the lists containing the verbs and their templates.

         
        | Populates the inflected forms of the verb.
        | Adds personal pronouns to the inflected verbs.

         
        | Populates the inflected forms of the verb.
        | This is the generic version of this method.
        | It does not add personal pronouns to the conjugated forms.
        | This method can handle any new language if the conjugation structure conforms to the Verbiste XML Schema.

         
        | This is the main method of this class.
        | It first checks to see if the verb is in Verbiste.
        | If it is not, and a pre-trained scikit-learn model has been supplied, the method then calls the model
        to predict the conjugation class of the provided verb.

        | Returns a Verb object or None.

        :param verb: string.
            Verb to conjugate.
        :param subject: string.
            Toggles abbreviated or full pronouns.
            The default value is 'abbrev'.
            Select 'pronoun' for full pronouns.
        :return: Verb object or None.

         
    This class defines the English Verb Object.

     
    This class defines the French Verb Object.

     
    This class defines the Italian Verb Object.

     
    This class defines the Portuguese Verb Object.

     
    This class defines the Romanian Verb Object.

     
    This class defines the Spanish Verb Object.

     
    This class defines the Verb Object.

    :param verb_info: VerbInfo Object.
    :param conjug_info: OrderedDict.
    :param subject: string.
        Toggles abbreviated or full pronouns.
        The default value is 'abbrev'.
        Select 'pronoun' for full pronouns.

     
    This class defines the Verbiste verb information structure.

    :param infinitive: string.
        Infinitive form of the verb.
    :param root: string.
        Lexical root of the verb.
    :param template: string.
        Name of the verb ending pattern.

     
    This is the class handling the Verbiste xml files.

    :param language: string.
    | The language of the conjugator. The default value is fr for French.
    | The allowed values are: fr, en, es, it, pt, ro.

     
    | Custom Vectorizer optimized for extracting verbs features.
    | The Vectorizer subclasses sklearn.feature_extraction.text.CountVectorizer .
    | As in Indo-European languages verbs are inflected by adding a morphological suffix,
    the vectorizer extracts verb endings and produces a vector representation of the verb with binary features.

    | The features are the verb ending ngrams. (ngram_range is set at class instanciation).

     
    | This class holds and manages the data set.
    | Defines helper functions for managing Machine Learning tasks like constructing a training and testing set.

    :param VerbisteObj:
        Instance of a Verbiste object.

     
    | This class manages the scikit-learn model.
    | The Pipeline includes a feature vectorizer, a feature selector and a classifier.
    | If any of the vectorizer, feature selector or classifier is not supplied at instance declaration,
    the __init__ method will provide good default values that get more than 92% prediction accuracy.

    :param vectorizer: scikit-learn Vectorizer.
    :param feature_selector: scikit-learn Classifier with a fit_transform() method
    :param classifier: scikit-learn Classifier with a predict() method

     
    | This is the main class of the project.
    | The class manages the Verbiste data set and provides an interface with the scikit-learn model.
    | If no parameters are provided, the default language is set to french and the pre-trained french conjugation model is used.
    | The class defines the method conjugate(verb, language) which is the main method of the module.

    :param language: string.
        Language of the conjugator. The default language is 'fr' for french.
    :param model: string.
        A user provided model if the user has trained his own model.

     Console script for mlconjug. The language for the conjugation model. The values can be fr, en, es, it, pt or ro. The default value is fr. The split proportion must be between 0 and 1. The supplied word: {0} is not a valid verb in {1}. Unsupported language.
The allowed languages are fr, en, es, it, pt, ro. Project-Id-Version: 
POT-Creation-Date: 2018-06-15 21:51+0200
PO-Revision-Date: 2018-06-17 17:22+0200
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: pygettext.py 1.5
X-Generator: Poedit 2.0.8
Last-Translator: SekouD <sekoud.python@gmail.com>
Plural-Forms: nplurals=2; plural=(n > 1);
Language: fr
 
        Assigne le modèle scikit-learn pré-entrainé fourni pour pouvoir conjuguer les verbes inconnus.

        :param model: scikit-learn Classifier ou Pipeline.

         
        Récupère les informations de conjugaison correspondant à la classe de conjugaison donnée.

        :param template: string.
            Nom de la classe de conjugaison du verbe.
        :return: OrderedDict or None.
            OrderedDict contenant les suffixes conjugués de la classe de conjugaison.

         
        Récupère les informations du verbe et renvoie une instance de VerbInfo.

        :param verb: string.
            Verbe à conjuguer.
        :return: VerbInfo object or None.

         
        Charge et analyse les conjugaisons à partir du fichier XML.

        :param conjugations_file: string or path object.
            Chemin vers le fichier XML de conjugaison.

         
        Charge et analyse les formes fléchies du temps à partir du fichier xml.

        :param tense: string.
            Le temps en cours de traitement.
        :return: list.
            Liste des suffixes conjugués.

         
        Charge et analyse les verbes du fichier XML.

        :param verbs_file: string or path object.
            Chemin vers le fichier xml des verbes.

         
        Analyse le fichier XML

        :param file: FileObject.
            Fichier XML contenant les classes de conjugaison
        :return: OrderedDict.
            Un OrderedDict contenant toutes les classes de conjugaison dans le fichier.

         
        Analyse le fichier XML

        :param file: FileObject.
            Fichier XML contenant les verbes.
        :return: OrderedDict.
            Un OrderedDict contenant le verbe et sa classe de conjugaison pour tous les verbes du fichier.

         
        Analyse un verbe et renvoie les n-grams de fin.

        :param verb: string.
            Verbe à vectoriser.
        :return: list.
            N-grammes finaux du verbe.
         
        Prédit la classe de conjugaison de la liste de verbes fournie.

        :param verbs: list.
            Liste des verbes
        :return: list.
            Liste des groupes de conjugaison prédits.

         
        Divise les données en un ensemble d'entrainement et de test.

        :param threshold: int.
            Taille minimale de la classe de conjugaison à diviser.
        :param proportion: float.
            Proportion d'échantillons dans l'ensemble d'apprentissage.
            Doit être compris entre 0 et 1.

         
        Entraîne le modèle sur les échantillons et les labels fournis.

        :param samples: list.
            Liste des verbes
        :param labels: list.
            Liste des classes de conjugaison des verbes

         
        | Vérifie si le verbe est un verbe valide dans la langue donnée.
        | Les mots anglais sont toujours traités comme des verbes possibles.
        | Les verbes dans d'autres langues sont filtrés par leurs terminaisonss.

        :param verb: string.
            Le verbe a conjuguer.
        :return: bool.
            True si le verbe est un verbe valide dans la langue. False sinon.

         
        | Détecte les terminaisonss autorisées pour les verbes dans les langues prises en charge.
        | Toutes les langues prises en charge à l'exception de l'anglais limitent la forme qu'un verbe peut prendre.
        | Comme l'anglais est beaucoup plus productif et varié dans la morphologie de ses verbes, n'importe quel mot est autorisé comme un verbe.

         : return: set.
            Un ensemble contenant les terminaisons autorisées des verbes dans la langue cible.

         
        | Remplit le dictionnaire contenant les classes de conjugaison.
        | Remplit les listes contenant les verbes et leurs classes de conjugaison.

         
        | Remplit les formes fléchies du verbe.
        | Ajoute les pronoms personnels aux verbes fléchis.

         
        | Remplit les formes fléchies du verbe.
        | C'est la version générique de cette méthode.
        | Cette méthode n'ajoute pas de pronoms personnels aux formes conjuguées.
        | Cette méthode peut gérer n'importe quel nouvelle langue si la structure de conjugaison est conforme au schéma XML de Verbiste.

         
        | C'est la méthode principale de cette classe.
        | La méthode vérifie d'abord si le verbe est dans Verbiste.
        | Si ce n'est pas le cas, et qu'un modèle scikit-learn pré-entrainé a été fourni, la méthode appelle alors le modèle
        pour prédire la classe de conjugaison du verbe fourni.

        | Retourne un objet Verbe ou None.

        :param verb: string.
            Verbe pour conjuguer.
        :param subject: string.
            Selectionne les pronoms abrégés ou complets.
            La valeur par défaut est 'abbrev'.
            Sélectionnez "pronom" pour les pronoms complets.
        :return: Verb object or None.

         
    Cette classe définit l'objet Verb anglais.

     
    Cette classe définit l'objet Verb français.

     
    Cette classe définit l'objet Verb italien.

     
    Cette classe définit l'objet Verb portugais.

     
    Cette classe définit l'objet Verb roumain.

     
    Cette classe définit l'objet Verb espagnol.

     
    Cette classe définit l'objet Verb.

    :param verb_info: VerbInfo Object.
    :param conjug_info: OrderedDict.
    :param subject: string.
        Bascule les pronoms abrégés ou complets.
        La valeur par défaut est 'abbrev'.
        Sélectionnez "pronom" pour les pronoms complets.

     
    Cette classe définit la structure d'information du verbe dans Verbiste.

    :param infinitive: string.
        Forme infinitive du verbe.
    :param root: string.
        Racine lexicale du verbe.
    :param template: string.
        Nom de la classe de conjugaison du verbe.

     
    C'est la classe qui manipule les fichiers XML de Verbiste.

    :param language: string.
     | La langue du conjugateur. La valeur par défaut est fr pour le français.
     | Les valeurs autorisées sont: fr, en, es, it, pt, ro.

     
    | Vectorizer personnalisé optimisé pour extraire les caractéristiques des verbes.
    | Le Vectorizer hérite de sklearn.feature_extraction.text.CountVectorizer.
    | Comme dans les langues indo-européennes, les verbes sont infléchis en ajoutant un suffixe morphologique,
    le vectorizer extrait les terminaisons verbales et produit une représentation vectorielle du verbe avec des caractéristiques binaires.

    | Les caractéristiques sont la terminaison verbale ngrams. (ngram_range est défini à l'instanciation de la classe).

     
    | Cette classe contient et gère l'ensemble des données.
    | Définit les fonctions d'assistance pour la gestion des tâches d'apprentissage automatique, telles que la construction d'un ensemble d'entrainement et de test.

    :param VerbisteObj:
        Instance d'un objet Verbiste.

     

    | Cette classe gère le modèle scikit-learn.
    | Le Pipeline comprend un vectorizer de caractéristiques, un sélecteur de caractéristiques et un classificateur.
    | Si l'un des vectorizer, sélecteur de caractéristiques ou classificateur n'est pas fourni lors de la déclaration d'instance,
    la méthode __init__ fournira de bonnes valeurs par défaut qui obtiendront plus de 92% de précision de prédiction.

    :param vectorizer: scikit-learn Vectorizer.
    :param feature_selector: scikit-learn Classifier avec une méthode fit_transform ()
    :param classifier: scikit-learn Classifier avec une méthode predict ()

     
    | Ceci est la classe principale du projet.
    | La classe gère la base de données Verbiste et fournit une interface avec le modèle scikit-learn.
    | Si aucun paramètre n'est fourni, la langue par défaut est le français et le modèle de conjugaison français pré-entraîné est utilisé.
    | La classe définit la méthode conjugate(verbe, langue) qui est la méthode principale du module.

    :param language: string.
        Langue du conjugateur. La langue par défaut est 'fr' pour le français.
    :param model: string.
        Un modèle fourni par l'utilisateur si l'utilisateur a formé son propre modèle.

     Script de console pour mlconjug. La langue du modèle de conjugaison. Les valeurs peuvent être fr, en, es, it, pt ou ro. La valeur par défaut est fr. La proportion doit être comprise entre 0 et 1. Le mot fourni: {0} n'est pas un verbe valide en {1}. Langue non prise en charge
Les langues autorisées sont fr, en, es, it, pt, ro. 