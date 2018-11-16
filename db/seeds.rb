Diagnosis.create([
  { title: 'Sinus Infection',     description: 'When your sinus canal is infected',  gender: :both },
  { title: 'Migraine',            description: 'When your head hurts real bad.',     gender: :both },
  { title: 'Ovarian Cancer',      description: 'When your ovaries are sick.',        gender: :female },
  { title: 'Testicular Cancer',   description: 'When your testicles hurt real bad.', gender: :male },
  { title: 'Kids Cough',          description: 'When kids get a cough.',             age_min: 0, age_max: 18 },
  { title: 'Adult Cough',         description: 'When adults get a cough.',           age_min: 19, age_max: 40 },
  { title: 'Granny Cough',        description: 'When older people get a cough.',     age_min: 41, age_max: 120 },
])

Medication.create([
  { title: 'Tylenol',             description: 'Acetaminophen. It can treat minor aches and pains, and reduces fever.' },
  { title: 'Advil',               description: 'It can treat minor aches and pains, and reduces fever.' },
  { title: 'X-lax',               description: 'In treatment of poo-poo problems.' },
  { title: 'Flintstone Vitamins', description: 'In treatment of pretty much nothing.',       age_min: 0, age_max: 18 },
  { title: 'Wolfs Bane',          description: 'In treatment of werewolf bites.',            age_min: 19, age_max: 40 },
  { title: 'Metamucil',           description: 'Fiber based treatment of poo-poo problems.', age_min: 41, age_max: 120 },
  { title: 'Metamucil for Men',   description: 'Fiber based treatment of poo-poo problems.', age_min: 41, age_max: 120, gender: :male },
  { title: 'Metamucil for Women', description: 'Fiber based treatment of poo-poo problems.', age_min: 41, age_max: 120, gender: :female },
])

Consideration.create([
  { title: 'Pregnant',                   gender: :female            },
  { title: 'Recent Penal-augmentation',  gender: :male              },
  { title: 'Organ Transplant',           gender: :both              },
  { title: 'Substance Abuse',            gender: :both              },
  { title: 'Concussion',                 gender: :both              },
  { title: 'Chest Pains',                gender: :both,  exit: true },
])

Symptom.create!([
  {
    title: 'Head',
    symptoms: Symptom.create([
      { title: 'Forehead' },
      { title: 'Ears' },
      { title: 'Nose' },
      { title: 'Eyes' },
      { title: 'Child only', age_min: 0, age_max: 18 },
      { title: 'Adult only', age_min: 19, age_max: 120 },
    ])
  },
  {
    title: 'Torso',
    symptoms: Symptom.create([
      { title: 'Heart' },
      { title: 'Lungs' },
      { title: 'Ribs' },
      { title: 'Shoulders' },
      { title: 'Child only', age_min: 0, age_max: 18 },
      { title: 'Adult only', age_min: 19, age_max: 120 },
    ])
  },
  {
    title: 'Legs',
    symptoms: Symptom.create([
      { title: 'Thighs' },
      { title: 'Calfs' },
      { title: 'Hips' },
      { title: 'Feet' },
      { title: 'Child only', age_min: 0, age_max: 18 },
      { title: 'Adult only', age_min: 19, age_max: 120 },
    ])
  },
])

Symptom.where.not(parent_id: nil).each do |symptom|
  final_symptoms = symptom.symptoms.create([
    {
      title: "Level 1 #{symptom.title}",
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Level 2 #{symptom.title}",
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Level 3 #{symptom.title}",
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Level 4 #{symptom.title} (Female Only)",
      gender: :female,
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Level 4 #{symptom.title} (Male Only)",
      gender: :male,
      diagnosis: Diagnosis.all.shuffle.first
    },
  ])

  third_tier_symptoms = symptom.symptoms.create([
    {
      title: "Option A",
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Option B",
      diagnosis: Diagnosis.all.shuffle.first
    },
    {
      title: "Option C",
      diagnosis: Diagnosis.all.shuffle.first
    }
  ])
end
