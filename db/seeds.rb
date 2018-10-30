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

Symptom.create!([
  {
    title: 'Head',
    symptoms: Symptom.create([
      { title: 'Forehead' },
      { title: 'Ears' },
      { title: 'Nose' },
      { title: 'Eyes' },
    ])
  },
  {
    title: 'Torso',
    symptoms: Symptom.create([
      { title: 'Heart' },
      { title: 'Lungs' },
      { title: 'Ribs' },
      { title: 'Shoulders' },
    ])
  },{
    title: 'Legs',
    symptoms: Symptom.create([
      { title: 'Thighs' },
      { title: 'Calfs' },
      { title: 'Hips' },
      { title: 'Feet' },
    ])
  },
])

Symptom.where.not(parent_id: nil).each do |symptom|
  symptom.symptoms.create([
    { title: "Level 1 #{symptom.title}" },
    { title: "Level 2 #{symptom.title}" },
    { title: "Level 3 #{symptom.title}" },
  ])
end
