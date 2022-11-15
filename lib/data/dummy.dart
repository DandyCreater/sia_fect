class Dummy {
  const Dummy._();

// Student =========================================================
  static const studentA = {
    'name': 'Paulo da Costa',
    'short_name': 'A',
    'registration_number': '201802040098', // ba login nia
    'avatar_url':
        'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png',
    'faculty': 'Faculdade de Engenharia Ciencia e Tecnologia',
    'major': 'Informatics Engineering',
    'Semestre': '7',
    'place_of_birth': 'Lospalos',
    'date_of_birth': '1998-05-18', // formatu tenki  YYYY-MM-DD
    'phone': '74192621',
    'password': 'password',
    'user_type': 'student', // tipe user(student/lecturer)
    'Media': '7.5',
    'ip': '3.1',
    'lecturer': lecturerA, // foti dados lecturer
    'score': [
      // Aumenta dados valor no materia
      {
        'is_final': true,
        'year': '2023 impar',
        'media': '7.5',
        'ip': '3.1',
      },
      {
        'is_final': true,
        'year': '2022 Par',
        'Media': '-',
        'ip': '-',
        'status': 'ACC',
        'prejente': '0',
        'falta': '0',
        'persen': '0%',
        'lecturer': 'Lecturer A',
      },
      {
        'is_final': false,
        'year': '2021 Impar',
        'Media': '8.37',
        'ip': '3.1',
        'courses': [
          {
            'course': courseMI,
            'is_questionaire_done': true,
            'score': '8.4',
            'grade': 'A',
          },
          {
            'course': courseTEC,
            'is_questionaire_done': true,
            'score': '9',
            'grade': 'A',
          },
          {
            'course': courseCRIP,
            'is_questionaire_done': true,
            'score': '7',
            'grade': 'B',
          },
          {
            'course': courseES,
            'is_questionaire_done': true,
            'score': '7',
            'grade': 'B',
          },
          {
            'course': courseCM,
            'is_questionaire_done': true,
            'score': '9',
            'grade': 'A',
          },
          {
            'course': courseSAD,
            'is_questionaire_done': true,
            'score': '8.52',
            'grade': 'A',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2020 Par',
        'Media': '8.03',
        'ip': '3.21',
        'courses': [
          {
            'course': courseIO,
            'is_questionaire_done': true,
            'score': '6.1',
            'grade': 'C',
          },
          {
            'course': courseTA,
            'is_questionaire_done': true,
            'score': '9.24',
            'grade': 'A',
          },
          {
            'course': courseSI,
            'is_questionaire_done': true,
            'score': '9',
            'grade': 'A',
          },
          {
            'course': courseIA,
            'is_questionaire_done': true,
            'score': '8.8',
            'grade': 'A',
          },
          {
            'course': courseRC2,
            'is_questionaire_done': true,
            'score': '7.62',
            'grade': 'B',
          },
          {
            'course': courseLPA,
            'is_questionaire_done': true,
            'score': '7.4',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2020 Impar',
        'Media': '8.37',
        'ip': '3.35',
        'courses': [
          {
            'course': courseSO,
            'is_questionaire_done': true,
            'score': '8.3',
            'grade': 'B',
          },
          {
            'course': courseSM,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'A',
          },
          {
            'course': courseIPC,
            'is_questionaire_done': true,
            'score': '7.5',
            'grade': 'B',
          },
          {
            'course': courseBD2,
            'is_questionaire_done': true,
            'score': '9',
            'grade': 'A',
          },
          {
            'course': courseLI1,
            'is_questionaire_done': true,
            'score': '8.3',
            'grade': 'B',
          },
          {
            'course': courseAED,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'A',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2019 Par',
        'Media': '7.10',
        'ip': '2.84',
        'courses': [
          {
            'course': coursePOO,
            'is_questionaire_done': true,
            'score': '7.8',
            'grade': 'B',
          },
          {
            'course': courseAM2,
            'is_questionaire_done': true,
            'score': '5.5',
            'grade': 'C',
          },
          {
            'course': coursePE,
            'is_questionaire_done': true,
            'score': '7.51',
            'grade': 'B',
          },
          {
            'course': courseMN,
            'is_questionaire_done': true,
            'score': '6',
            'grade': 'C',
          },
          {
            'course': courseDB1,
            'is_questionaire_done': true,
            'score': '8',
            'grade': 'B',
          },
          {
            'course': coursePW,
            'is_questionaire_done': true,
            'score': '7.3',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2019 Impar',
        'Media': '7.07',
        'ip': '2.83',
        'courses': [
          {
            'course': courseAM1,
            'is_questionaire_done': true,
            'score': '6.1',
            'grade': 'C',
          },
          {
            'course': courseALGA,
            'is_questionaire_done': true,
            'score': '6',
            'grade': 'C',
          },
          {
            'course': courseMD,
            'is_questionaire_done': true,
            'score': '7.7',
            'grade': 'B',
          },
          {
            'course': courseAOC,
            'is_questionaire_done': true,
            'score': '8',
            'grade': 'B',
          },
          {
            'course': courseIP,
            'is_questionaire_done': true,
            'score': '7',
            'grade': 'B',
          },
          {
            'course': courseLISD,
            'is_questionaire_done': true,
            'score': '7.7',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2018 Par',
        'Media': '6.63',
        'ip': '2.65',
        'courses': [
          {
            'course': courseLP2,
            'is_questionaire_done': true,
            'score': '5.5',
            'grade': 'C',
          },
          {
            'course': courseEM,
            'is_questionaire_done': true,
            'score': '6.3',
            'grade': 'C',
          },
          {
            'course': courseCFIS,
            'is_questionaire_done': true,
            'score': '6',
            'grade': 'C',
          },
          {
            'course': courseIEI,
            'is_questionaire_done': true,
            'score': '6.5',
            'grade': 'C',
          },
          {
            'course': courseLI2,
            'is_questionaire_done': true,
            'score': '7.4',
            'grade': 'A',
          },
          {
            'course': courseLT2,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2018 Impar',
        'Media': '7.43',
        'ip': '2.97',
        'courses': [
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '6',
            'grade': 'C',
          },
          {
            'course': courseLT1,
            'is_questionaire_done': true,
            'score': '7.5',
            'grade': 'B',
          },
          {
            'course': courseLI1,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'A',
          },
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'A',
          },
          {
            'course': courseFIS,
            'is_questionaire_done': true,
            'score': '6.5',
            'grade': 'C',
          },
          {
            'course': courseIB,
            'is_questionaire_done': true,
            'score': '7.42',
            'grade': 'B',
          }
        ],
      },
    ]
  };

  static const studentB = {
    'name': 'Student B',
    'short_name': 'B',
    'registration_number': '1002',
    'avatar_url':
        'https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png',
    'faculty': 'Engineering',
    'major': 'Informatics Engineering',
    'Semestre': '6',
    'place_of_birth': 'Medan',
    'date_of_birth': '2000-03-21',
    'phone': '081342319876',
    'password': 'password',
    'user_type': 'student',
    'Media': '8.4',
    'ip': '8.37',
    'lecturer': lecturerB,
    'score': [
      {
        'is_final': false,
        'year': '2022 Par',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.1',
            'grade': 'B',
          },
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.4',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2022 Impar',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.1',
            'grade': 'B',
          },
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.4',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2021 Par',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.1',
            'grade': 'B',
          },
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2021 Impar',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.1',
            'grade': 'B',
          },
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.2',
            'grade': 'B',
          }
        ],
      },
    ]
  };

  // Student Semestre akhir
  static const studentC = {
    'name': 'Paulo da Costa',
    'short_name': 'C',
    'registration_number': '20180204098',
    'avatar_url':
        'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png',
    'faculty': 'Engineering',
    'major': 'Informatics Engineering',
    'Semestre': '8',
    'place_of_birth': 'Dili',
    'date_of_birth': '1998-05-18',
    'phone': '081342319876',
    'password': 'password',
    'user_type': 'student',
    'lecturer': lecturerB,
    'score': [
      {
        'is_final': true,
        'year': '2022 Par',
        'Media': '8.37',
        'ip': '8.37',
        'status': 'ACC',
        'prejente': '0',
        'falta': '0',
        'persen': '0%',
        'lecturer': 'Lecturer A',
      },
      {
        'is_final': false,
        'year': '2022 Par',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseMB,
            'is_questionaire_done': true,
            'score': '8.1',
            'grade': 'B',
          },
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.4',
            'grade': 'B',
          }
        ],
      },
      {
        'is_final': false,
        'year': '2022 Impar',
        'Media': '8.37',
        'ip': '8.37',
        'courses': [
          {
            'course': courseLPI,
            'is_questionaire_done': true,
            'score': '8.5',
            'grade': 'B',
          },
          {
            'course': courseMB,
            'is_questionaire_done': false,
            'score': '8.1',
            'grade': 'B',
          },
        ],
      },
    ]
  };
// End of Student data =========================================================

// Lecturer =========================================================
  static const lecturerA = {
    'name': 'Lecturer A',
    'short_name': 'Lec A',
    'registration_number': '2001',
    'avatar_url':
        'https://cdn3d.iconscout.com/3d/premium/thumb/teacher-avatar-5966945-4936175.png',
    'faculty': 'Engineering',
    'major': 'Informatics Engineering',
    'place_of_birth': 'Baucau ',
    'date_of_birth': '2000-03-21',
    'phone': '670 728391283',
    'password': 'password',
    'user_type': 'lecturer'
  };

  static const lecturerB = {
    'name': 'Lecturer B',
    'short_name': 'Lec B',
    'registration_number': '2002',
    'avatar_url':
        'https://cdn3d.iconscout.com/3d/premium/thumb/professor-4928348-4107724.png',
    'faculty': 'Engineering',
    'major': 'Informatics Engineering',
    'place_of_birth': 'Lospalos',
    'date_of_birth': '2000-03-21',
    'phone': '670 728391283',
    'password': 'password',
    'user_type': 'lecturer',
  };
// End of lecturer data =========================================================

// Course =========================================================
  static const courseLPI = {
    'name': 'Lingua Portugues I',
    'code': 'EI-LPI',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 201',
    'time': '11:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'B',
  };

  static const courseLT1 = {
    'name': 'Língua Tetum I ',
    'code': 'EI-LT1',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'B 102',
    'time': '09:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };

  static const courseLI1 = {
    'name': ' Língua Inglês I ',
    'code': 'EI-LI1',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'C 202',
    'time': '13:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'C',
  };

  static const courseMB = {
    'name': ' Matemática Básica',
    'code': 'EI-MB ',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 302',
    'time': '15:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };

  static const courseFIS = {
    'name': 'Física  ',
    'code': 'EI-FIS',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIB = {
    'name': ' Informática Básica   ',
    'code': 'EI-IB',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseLP2 = {
    'name': 'Língua Português II  ',
    'code': ' EI-LP2',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseLT2 = {
    'name': 'Língua Tetum II   ',
    'code': 'EI-LT2',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseLI2 = {
    'name': 'Língua Inglês II   ',
    'code': 'EI-LI2 ',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseEM = {
    'name': 'Ética Moral   ',
    'code': ' EI-EM',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseCFIS = {
    'name': 'Complemento Física   ',
    'code': 'EI-CFIS',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIEI = {
    'name': ' Introdução à Engenharia Informática   ',
    'code': ' EI-IEI',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseAM1 = {
    'name': 'Análise Matemática I',
    'code': 'EI-AM1',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseALGA = {
    'name': ' Álgebra Linear e Geometria Analítica',
    'code': 'EI-ALGA',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseMD = {
    'name': 'Matemática Discreta',
    'code': ' EI-MD',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseLISD = {
    'name': ' Logica Informática & Sistema Digitais ',
    'code': 'EI-LISD',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseAOC = {
    'name': ' Arquitectura e Organização de Computador',
    'code': 'EI-AOC',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIP = {
    'name': 'Introdução à Programação ',
    'code': 'EI-IP',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseAM2 = {
    'name': ' Análise Matemática II ',
    'code': 'EI-AM2',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const coursePE = {
    'name': 'Probabilidade e Estatística ',
    'code': ' EI-PE',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseMN = {
    'name': ' Métodos Numéricos',
    'code': ' EI-MN',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseDB1 = {
    'name': 'Base de Dados I',
    'code': ' EI-DB1',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const coursePW = {
    'name': 'Programação Web',
    'code': ' EI-PW',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const coursePOO = {
    'name': ' Programação Orientada aos Objectos',
    'code': 'EI-POO',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseSO = {
    'name': 'Sistemas Operativos',
    'code': 'EI-SO',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseSM = {
    'name': 'Sistemas Multimédia ',
    'code': 'EI-SM',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIPC = {
    'name': 'Interface Pessoa e Computador',
    'code': 'EI-IPC',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseBD2 = {
    'name': 'Bases de Dados II',
    'code': 'EI-BD2',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseRC1 = {
    'name': 'Redes de Computadores I',
    'code': 'EI-RC1',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseAED = {
    'name': 'Algoritmos e Estruturas de Dados',
    'code': 'EI-AED',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIO = {
    'name': 'Investigação Operacional',
    'code': 'EI-IO',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseTA = {
    'name': 'Teoria de Autômata ',
    'code': 'EI-TA',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseSI = {
    'name': 'Sistemas de Informáção ',
    'code': 'EI-SI',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseIA = {
    'name': 'Inteligência Artificial',
    'code': 'EI-IA',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseRC2 = {
    'name': 'Redes de Computadores II ',
    'code': 'EI-RC2',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseLPA = {
    'name': 'Laboratório de Programação Avançada ',
    'code': 'EI-LPA',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseMI = {
    'name': ' Metodologia de Investigação',
    'code': 'EI-MI',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseTEC = {
    'name': 'Techopreneurship',
    'code': 'EI-TEC',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseCM = {
    'name': 'Computação Móvel ',
    'code': 'EI-CM',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseES = {
    'name': 'Engenharia de Software ',
    'code': 'EI-ES',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseCRIP = {
    'name': 'Criptografia ',
    'code': 'EI-CRIP',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };
  static const courseSAD = {
    'name': 'Sistema de Apoia de Desisao ',
    'code': 'EI-SAD',
    'selected_class': '',
    'lecture': 'Mr. Lecture S.SI., M.SI',
    'room': 'A 303',
    'time': '17:00',
    'kred': '4',
    'at': '2',
    'ap': '1.3',
    'ea': '2',
    'th/s': '5.3',
    'class': 'A',
  };

  // End of course data =========================================================

  static const students = [studentA, studentB, studentC];
  static const lecturers = [lecturerA, lecturerB];
  static const courses = [
    courseLPI,
    courseLT1,
    courseLI1,
    courseMB,
    courseFIS,
    courseIB,
    // courseLP2,
    // courseLT2,
    // courseLI2,
    // courseEM,
    // courseCFIS,
    // courseIEI,
    // courseAM1,
    // courseALGA,
    // courseMD,
    // courseLISD,
    // courseAOC,
    // courseIP,
    // courseAM2,
    // coursePE,
    // courseMN,
    // courseDB1,
    // coursePW,
    // coursePOO,
    // courseSO,
    // courseSM,
    // courseIPC,
    // courseBD2,
    // courseRC1,
    // courseAED,
    // courseIO,
    // courseTA,
    // courseSI,
    // courseIA,
    // courseRC2,
    // courseLPA,
    // courseMI,
    // courseTEC,
    // courseCM,
    // courseES,
    // courseCRIP,
    // courseSAD,
  ];

  // Dados ne'ebe generate ba pdf (preview ho file)
  static const pdfData = studentA;

  static const scheduleStudent = [
    {
      'date': '2022-09-06',
      'day': 'Monday',
      'courses': [
        courseLPI,
        courseLI1,
      ]
    },
    {
      'date': '2022-09-07',
      'day': 'Tuesday',
      'courses': [
        courseLT1,
      ]
    },
    {
      'date': '2022-09-08',
      'day': 'Wednesday',
      'courses': [
        courseLI1,
      ]
    },
    {
      'date': '2022-09-09',
      'day': 'Thursday',
      'courses': [
        courseMB,
        courseLI1,
      ]
    },
    {
      'date': '2022-09-10',
      'day': 'Friday',
      'courses': [
        courseLPI,
        courseLI1,
      ]
    },
  ];

  static const studentYears = [
    '2022 Par',
    '2022 Impar',
    '2021 Par',
    '2021 Impar',
    '2020 Par',
    '2020 Impar',
    '2019 Par',
    '2019 Impar',
    '2018 Par',
    '2018 Impar',
  ];

  static const lectureYears = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
  ];

  static const questionnaires = [
    {
      'question': 'Question 1',
      'type': 'choice', // tipu exkolha multipla
      'options': [
        'Option A',
        'Option B',
        'Option C',
        'Option D',
        'Option E',
      ],
    },
    {
      'question': 'Question 2',
      'type': 'choice',
      'options': [
        'Option A',
        'Option B',
        'Option C',
        'Option D',
        'Option E',
      ],
    },
    {
      'question': 'Question 3',
      'type': 'choice',
      'options': [
        'Option A',
        'Option B',
        'Option C',
        'Option D',
        'Option E',
      ],
    },
    {
      'question': 'Question 4',
      'type': 'choice',
      'options': [
        'Option A',
        'Option B',
        'Option C',
        'Option D',
        'Option E',
      ],
    },
    {
      'question': 'Question 5',
      'type': 'choice',
      'options': [
        'Option A',
        'Option B',
        'Option C',
        'Option D',
        'Option E',
      ],
    },
    {
      'question': 'Question 6',
      'type': 'text',
    },
    {
      'question': 'Question 7',
      'type': 'text',
    },
  ];

  static const listScoreLecturer = [
    {'year': '2022', 'user': studentB},
    {'year': '2021', 'user': studentB},
    {'year': '2020', 'user': studentB},
    {'year': '2019', 'user': studentB},
    {'year': '2018', 'user': studentB},
  ];

  static const curriculumData = [
    {
      'name': 'Semestre 1',
      'summary': [
        courseLPI,
        courseLT1,
        courseLI1,
        courseMB,
        courseFIS,
        courseLP2,
      ]
    },
    {
      'name': 'Semestre 2',
      'summary': [
        courseLP2,
        courseLT2,
        courseLI2,
        courseEM,
        courseCFIS,
        courseCFIS,
        courseIEI,
      ]
    },
    {
      'name': 'Semestre 3',
      'summary': [
        courseAM1,
        courseALGA,
        courseMD,
        courseLISD,
        courseAOC,
        courseIP
      ]
    },
    {
      'name': 'Semestre 4',
      'summary': [
        courseAM2,
        coursePE,
        courseMN,
        courseDB1,
        coursePW,
        coursePOO,
      ]
    },
    {
      'name': 'Semestre 5',
      'summary': [
        courseSO,
        courseSM,
        courseIPC,
        courseBD2,
        courseRC1,
        courseAED,
      ]
    },
    {
      'name': 'Semestre 6',
      'summary': [
        courseIO,
        courseTA,
        courseSI,
        courseIA,
        courseRC2,
        courseLPA,
      ]
    },
    {
      'name': 'Semestre 7',
      'summary': [
        courseMI,
        courseTEC,
        courseES,
        courseCM,
        courseCRIP,
        courseSAD,
      ]
    },
    {
      'name': 'Semestre 8',
      'summary': [
        courseMB,
        courseLI1,
        courseLT1,
        courseLPI,
      ]
    },
  ];

  static const historyFpe = [
    {
      'date': '01 January 2022',
      'year': '2022 Impar',
      'courses': [
        courseMB,
        courseLI1,
        courseLT1,
        courseLPI,
      ]
    },
    {
      'date': '01 July 2021',
      'year': '2021 Par',
      'courses': [
        courseMB,
        courseLT1,
        courseLPI,
      ]
    }
  ];
}
