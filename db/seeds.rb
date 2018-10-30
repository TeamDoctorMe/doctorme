Diagnosis.create([
  { title: 'Sinus Infection',   description: 'When your sinus canal is infected', gender: :both },
  { title: 'Migraine',          description: 'When your head hurts real bad.', gender: :both },
  { title: 'Ovarian Cancer',    description: 'When your ovaries are sick.', gender: :female },
  { title: 'Testicular Cancer', description: 'When your testicles hurt real bad.', gender: :male }
])

Medication.create([
  { title: 'Tylenol', description: 'Acetaminophen. It can treat minor aches and pains, and reduces fever.' },
  { title: 'Advil',   description: 'It can treat minor aches and pains, and reduces fever.' },
  { title: 'X-lax',   description: 'In treatment of poo-poo problems.' }
])

Consideration.create([
  { title: 'Pregnant',          gender: :female            },
  { title: 'Organ Transplant',  gender: :both              },
  { title: 'Substance Abuse',   gender: :both              },
  { title: 'Concussion',        gender: :both              },
  { title: 'Chest Pains',       gender: :both,  exit: true },
])
