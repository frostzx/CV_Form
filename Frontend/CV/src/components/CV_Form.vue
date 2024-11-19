<template>
  <v-container>
    <v-card
      class="align-center mx-auto pa-8"
      max-width="900"
      elevation="2"
    >
      <!-- Step 1 : Personal Details --> 
      <v-row>
        <v-col>
          <p class="text-h6 font-weight-bold">
            Personal Details
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">
            Wanted Job Title
            <v-tooltip bottom>
              <template #activator="{ props }">
                <v-icon
                  class="pb-2"
                  v-bind="props" 
                  small
                  color="primary"
                >
                  mdi-help-circle-outline
                </v-icon>
              </template>
              <span>Enter the job title you are applying for.</span>
            </v-tooltip>
          </p>
          <v-text-field
            v-model="form.wantedJobTitle"
            :error-messages="errors.firstName"
            density="compact"
            variant="solo"
          />
        </v-col>
        <v-col class="pb-0 pt-6">
          <v-row class="d-flex align-center">
            <v-avatar
              size="67"
              class="me-3"
              :style="{ backgroundColor: '#f5f5f5', cursor: 'pointer', borderRadius: '0' }"
              @click="triggerFileInput"
            >
              <template v-if="imageUrl">
                <v-img :src="imageUrl" />
              </template>
              <template v-else>
                <v-icon size="32" color="grey">mdi-account</v-icon>
              </template>
            </v-avatar>

            <v-btn variant="text" class="text-capitalize" @click="triggerFileInput" color="primary">
              Upload photo
            </v-btn>

            <input type="file" ref="fileInput" @change="onFileChange" accept="image/*" hidden />
          </v-row>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">First Name</p>
          <v-text-field v-model="form.firstName" :error-messages="errors.firstName" density="compact" variant="solo" />
        </v-col>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Last Name</p>
          <v-text-field v-model="form.lastName" density="compact" variant="solo" />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Email</p>
          <v-text-field
            v-model="form.email"
            density="compact"
            variant="solo"
            :error-messages="errors.email"
            @input="validateEmail"
          />
        </v-col>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Phone</p>
          <v-text-field
            v-model="form.phone"
            density="compact"
            variant="solo"
            :error-messages="errors.phone"
            @input="validatePhone"
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Country</p>
          <v-text-field v-model="form.country" :error-messages="errors.country" density="compact" variant="solo" />
        </v-col>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">City</p>
          <v-text-field v-model="form.city" :error-messages="errors.city" density="compact" variant="solo" />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Address</p>
          <v-text-field v-model="form.address" :error-messages="errors.address" density="compact" variant="solo" />
        </v-col>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Postal Code</p>
          <v-text-field v-model="form.postalCode" :error-messages="errors.postalCode" density="compact" variant="solo" />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Driving License 
            <v-tooltip bottom>
              <template #activator="{ props }">
                <v-icon
                  class="pb-2"
                  v-bind="props" 
                  small
                  color="primary"
                >
                  mdi-help-circle-outline
                </v-icon>
              </template>
              <span>Enter ID of Driving License.</span>
            </v-tooltip>
          </p>
          <v-text-field v-model="form.drivingLicense" :error-messages="errors.drivingLicense" density="compact" variant="solo" />
        </v-col>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Nationality
            <v-tooltip bottom>
              <template #activator="{ props }">
                <v-icon
                  class="pb-2"
                  v-bind="props" 
                  small
                  color="primary"
                >
                  mdi-help-circle-outline
                </v-icon>
              </template>
              <span>Enter your Nationality.</span>
            </v-tooltip>
          </p>
          <v-text-field v-model="form.nationality" :error-messages="errors.nationality" density="compact" variant="solo" />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pb-0">
          <p class="caption mb-0" style="color: grey">Place Of Birth</p>
          <v-text-field v-model="form.placeOfBirth" :error-messages="errors.placeOfBirth" density="compact" variant="solo" />
        </v-col>
        <v-col class="pb-0" style="color: grey">
          <p class="caption mb-0">
            Date Of Birth
            <v-tooltip bottom>
              <template #activator="{ props }">
                <v-icon
                  class="pb-2" 
                  v-bind="props" 
                  small
                  color="primary"
                >
                  mdi-help-circle-outline
                </v-icon>
              </template>
              <span>Enter the date when you're born.</span>
            </v-tooltip>
          </p>
          <v-text-field
            v-model="form.dateOfBirth"
            :error-messages="errors.dateOfBirth"
            type="date"
            variant="solo"
            density="compact"
            clearable
            :max="new Date().toLocaleDateString('en-CA')"
          />
        </v-col>
      </v-row>

      <!-- Step 2 : Professional Summary -->
      <v-row>
        <v-col class="pb-0">
          <p class="text-h6 font-weight-bold">
            Professional Summary
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pt-0">
          <p class="text-caption">
            Write 2-4 short & energetic sentences to interest the reader! Mention your role, experience & most importantly - your bigggest achievements, best qualities and skills.
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-row
            v-if="editor"
            class="border pa-4"
            :style="{ borderColor: '#c4c4c4', borderStyle: 'solid', borderWidth: '1px' }"
            align="center"
            no-gutters
          >
            <button
              :disabled="!editor.can().chain().focus().toggleBold().run()"
              :style="{ backgroundColor: editor?.isActive('bold') ? '#e0e0e0' : '#ffffff' }"
              class="pa-1"
              @click="editor.chain().focus().toggleBold().run()"
            >
              <v-icon icon="mdi-format-bold" />
            </button>
            <button
              :style="{ backgroundColor: editor?.isActive('italic') ? '#e0e0e0' : '#ffffff' }"
              :disabled="!editor.can().chain().focus().toggleItalic().run()"
              class="pa-1"
              @click="editor.chain().focus().toggleItalic().run()"
            >
              <v-icon icon="mdi-format-italic" />
            </button>
            <button
              :style="{ backgroundColor: editor?.isActive('underline') ? '#e0e0e0' : '#ffffff' }"
              :disabled="!editor.can().chain().focus().toggleUnderline().run()"
              class="pa-1"
              @click="editor.chain().focus().toggleUnderline().run()" 
            >
              <v-icon icon="mdi-format-underline" />
            </button>
            <button
              :style="{ backgroundColor: editor?.isActive('strike') ? '#e0e0e0' : '#ffffff' }"
              :disabled="!editor.can().chain().focus().toggleStrike().run()"
              class="pa-1"
              @click="editor.chain().focus().toggleStrike().run()"
            >
              <v-icon icon="mdi-format-strikethrough-variant" />
            </button>
            <v-divider
              class="mx-2" 
              vertical
              thickness="2"
            />
            <button
              :class="{ 'is-active': editor.isActive('orderedList') }"
              class="pa-1"
              @click="editor.chain().focus().toggleOrderedList().run()"
            >
              <v-icon icon="mdi-format-list-numbered" />
            </button>
            <button
              :style="{ backgroundColor: editor?.isActive('bulletList') ? '#e0e0e0' : '#ffffff' }"
              class="pa-1"
              @click="editor.chain().focus().toggleBulletList().run()"
            >
              <v-icon icon="mdi-format-list-bulleted" />
            </button>
          </v-row>
          <editor-content :editor="editor" />
        </v-col>
      </v-row>

      <!-- Step 3 : Employment History -->
      <v-row>
        <v-col class="pb-0">
          <p class="text-h6 font-weight-bold">
            Employment History
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pt-0">
          <p class="text-caption">
            Show your relevant experience (last 10 years). Use bullet points to note your achievements, if possible - use number/facts (Achieved X, measured by Y, by doing Z).
          </p>
        </v-col>
      </v-row>
      <v-row v-if="EmploymentHistory.length > 0">
        <v-col>
          <v-expansion-panels multiple>
            <v-expansion-panel 
              v-for="(items, i) in EmploymentHistory" 
              :key="i"
            >
              <v-expansion-panel-title>
                <v-row>
                  <div>
                    <v-col>
                      <p class="font-weight-bold">
                        {{ items.employmenthistory == "" ? "(Not specified)" : items.employmenthistory }}
                      </p>
                      <p style="color: grey" class="mt-2">
                        {{ items.date == "" ? "" : items.date }}
                      </p>
                    </v-col>
                  </div>
                </v-row>  
              </v-expansion-panel-title>
              <v-expansion-panel-text>
                <v-row>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">Job Title</p>
                    <v-text-field v-model="items.jobtitle" @input="onInputChange(i, 'Job Title')" density="compact" variant="solo" />
                  </v-col>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">Employer</p>
                    <v-text-field v-model="items.employer" @input="onInputChange(i, 'Employer')" density="compact" variant="solo" />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="pb-0">
                    <p class="caption mb-3" style="color: grey">Start & End Date
                      <v-tooltip bottom>
                        <template #activator="{ props }">
                          <v-icon 
                            class="pb-2"
                            v-bind="props"
                            small
                            color="primary"
                          >
                            mdi-help-circle-outline
                          </v-icon>
                        </template>
                        <span>MM/YYYY</span>
                      </v-tooltip>
                    </p>
                    <v-row class="px-3">
                      <v-text-field
                        v-model="items.startdate"
                        placeholder="MM/YYYY"
                        density="compact"
                        variant="solo"
                        class="mr-4"
                        @input="onInputChange(i, 'Start Date')"
                      />
                      <v-text-field
                        v-model="items.enddate"
                        placeholder="MM/YYYY"
                        density="compact"
                        variant="solo"
                        @input="onInputChange(i, 'End Date')"
                      />
                    </v-row>
                  </v-col>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">City</p>
                    <v-text-field v-model="items.city" density="compact" variant="solo" />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <p class="caption mb-0" style="color: grey">Description</p>
                    <v-row
                      v-if="items.editorInstance"
                      class="border pa-4"
                      :style="{ borderColor: '#c4c4c4', borderStyle: 'solid', borderWidth: '1px' }"
                      align="center"
                      no-gutters
                    >
                      <button
                        :disabled="!items.editorInstance.can().chain().focus().toggleBold().run()"
                        :style="{ backgroundColor: items.editorInstance?.isActive('bold') ? '#e0e0e0' : '#ffffff' }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleBold().run()"
                      >
                        <v-icon icon="mdi-format-bold" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('italic') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleItalic().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleItalic().run()"
                      >
                        <v-icon icon="mdi-format-italic" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('underline') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleUnderline().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleUnderline().run()" 
                      >
                        <v-icon icon="mdi-format-underline" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('strike') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleStrike().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleStrike().run()"
                      >
                        <v-icon icon="mdi-format-strikethrough-variant" />
                      </button>
                      <v-divider
                        class="mx-2" 
                        vertical
                        thickness="2"
                      />
                      <button
                        :class="{ 'is-active': items.editorInstance.isActive('orderedList') }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleOrderedList().run()"
                      >
                        <v-icon icon="mdi-format-list-numbered" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('bulletList') ? '#e0e0e0' : '#ffffff' }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleBulletList().run()"
                      >
                        <v-icon icon="mdi-format-list-bulleted" />
                      </button>
                    </v-row>
                    <editor-content :editor="items.editorInstance" />
                  </v-col>
                </v-row>
                <v-row class="px-3">
                  <p style="color: grey" class="text-caption">
                    Recruiter tip: write 200+ characters to increase interview chances
                  </p>
                  <v-spacer></v-spacer>
                  <p style="color: grey" class="text-caption">
                    {{ getCharacterCount(items.editorInstance) }} / 200+
                  </p>
                </v-row>
              </v-expansion-panel-text>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-col>
      </v-row>
      <v-row class="px-6 mb-4">
        <p 
          style="cursor: pointer;"
          class="text-primary"
          @click="addMoreEmployment()"
          v-text="EmploymentHistory.length == 0 ? '+ Add employment' : '+ Add one more employment' "
        />
        <v-spacer></v-spacer>
        <button
          v-if="EmploymentHistory.length > 0"
          class="pa-1 mr-4"
          @click="onDeleteForm('Employment History')"
        >
          <v-icon color="red" icon="mdi-trash-can-outline" />
        </button>
      </v-row>

      <!-- Step 4 : Education -->
      <v-row>
        <v-col class="pb-0">
          <p class="text-h6 font-weight-bold">
            Education
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pt-0">
          <p class="text-caption">
            A varied education on your resume sums up the value that your learnings and background will bring to job.
          </p>
        </v-col>
      </v-row>
      <v-row v-if="Education.length > 0">
        <v-col>
          <v-expansion-panels multiple>
            <v-expansion-panel 
              v-for="(items, i) in Education" 
              :key="i"
            >
              <v-expansion-panel-title>
                <v-row>
                  <div>
                    <v-col>
                      <p class="font-weight-bold">
                        {{ items.education == "" ? "(Not specified)" : items.education }}
                      </p>
                      <p style="color: grey" class="mt-2">
                        {{ items.date == "" ? "" : items.date }}
                      </p>
                    </v-col>
                  </div>
                </v-row>  
              </v-expansion-panel-title>
              <v-expansion-panel-text>
                <v-row>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">School</p>
                    <v-text-field v-model="items.school" @input="onInputChange(i, 'School')" density="compact" variant="solo" />
                  </v-col>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">Degree</p>
                    <v-text-field v-model="items.degree" @input="onInputChange(i, 'Degree')" density="compact" variant="solo" />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="pb-0">
                    <p class="caption mb-3" style="color: grey">Start & End Date
                      <v-tooltip bottom>
                        <template #activator="{ props }">
                          <v-icon 
                            class="pb-2"
                            v-bind="props"
                            small
                            color="primary"
                          >
                            mdi-help-circle-outline
                          </v-icon>
                        </template>
                        <span>MM/YYYY</span>
                      </v-tooltip>
                    </p>
                    <v-row class="px-3">
                      <v-text-field
                        v-model="items.startdate"
                        placeholder="MM/YYYY"
                        density="compact"
                        variant="solo"
                        class="mr-4"
                        @input="onInputChange(i, 'Start Date Edu')"
                      />
                      <v-text-field
                        v-model="items.enddate"
                        placeholder="MM/YYYY"
                        density="compact"
                        variant="solo"
                        @input="onInputChange(i, 'End Date Edu')"
                      />
                    </v-row>
                  </v-col>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">City</p>
                    <v-text-field v-model="items.city" density="compact" variant="solo" />
                  </v-col>
                </v-row>
                <v-row>
                  <v-col>
                    <p class="caption mb-0" style="color: grey">Description</p>
                    <v-row
                      v-if="items.editorInstance"
                      class="border pa-4"
                      :style="{ borderColor: '#c4c4c4', borderStyle: 'solid', borderWidth: '1px' }"
                      align="center"
                      no-gutters
                    >
                      <button
                        :disabled="!items.editorInstance.can().chain().focus().toggleBold().run()"
                        :style="{ backgroundColor: items.editorInstance?.isActive('bold') ? '#e0e0e0' : '#ffffff' }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleBold().run()"
                      >
                        <v-icon icon="mdi-format-bold" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('italic') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleItalic().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleItalic().run()"
                      >
                        <v-icon icon="mdi-format-italic" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('underline') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleUnderline().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleUnderline().run()" 
                      >
                        <v-icon icon="mdi-format-underline" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('strike') ? '#e0e0e0' : '#ffffff' }"
                        :disabled="!items.editorInstance.can().chain().focus().toggleStrike().run()"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleStrike().run()"
                      >
                        <v-icon icon="mdi-format-strikethrough-variant" />
                      </button>
                      <v-divider
                        class="mx-2" 
                        vertical
                        thickness="2"
                      />
                      <button
                        :class="{ 'is-active': items.editorInstance.isActive('orderedList') }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleOrderedList().run()"
                      >
                        <v-icon icon="mdi-format-list-numbered" />
                      </button>
                      <button
                        :style="{ backgroundColor: items.editorInstance?.isActive('bulletList') ? '#e0e0e0' : '#ffffff' }"
                        class="pa-1"
                        @click="items.editorInstance.chain().focus().toggleBulletList().run()"
                      >
                        <v-icon icon="mdi-format-list-bulleted" />
                      </button>
                    </v-row>
                    <editor-content :editor="items.editorInstance" />
                  </v-col>
                </v-row>
              </v-expansion-panel-text>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-col>
      </v-row>
      <v-row class="px-6 mb-4">
        <p 
          style="cursor: pointer;"
          class="text-primary"
          @click="addMoreEducation()"
          v-text="Education.length == 0 ? '+ Add education' : '+ Add one more education' "
        />
        <v-spacer></v-spacer>
        <button
          v-if="Education.length > 0"
          class="pa-1 mr-4"
          @click="onDeleteForm('Education')"
        >
          <v-icon color="red" icon="mdi-trash-can-outline" />
        </button>
      </v-row>

      <!-- Step 5 : Skills -->
      <v-row>
        <v-col class="pb-0">
          <p class="text-h6 font-weight-bold">
            Skills
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pt-0">
          <p class="text-caption">
            Choose 5 of the most important skills to show your talents! Make sure they match the keywords of the job listing if applying via an online system.
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="py-0">
          <v-switch
            v-model="SwitchExperience"
            label="Don't show experience level"
            hide-details
            inset
            density="compact"
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col class="pt-0">
          <v-chip-group
            column
            multiple
          >
            <v-chip
              v-for="(items, i) in SkillList"
              :key="i"
              :text="items.name"
              variant="outlined"
              filter
              label
              @click="items.isActive = !items.isActive, AddSkill(i)"
            />
          </v-chip-group>
        </v-col>
      </v-row>
      <v-row v-if="Skills.length > 0">
        <v-col>
          <v-expansion-panels multiple>
            <v-expansion-panel 
              v-for="(items, i) in Skills" 
              :key="i"
            >
              <v-expansion-panel-title>
                <v-row>
                  <div>
                    <v-col>
                      <p class="font-weight-bold">
                        {{ items.skilltitle == "" ? "(Not specified)" : items.skilltitle }}
                      </p>
                      <p v-if="!SwitchExperience" style="color: grey" class="mt-2">
                        {{ items.levelskill == "" ? "" : items.levelskill }}
                      </p>
                    </v-col>
                  </div>
                </v-row>  
              </v-expansion-panel-title>
              <v-expansion-panel-text>
                <v-row>
                  <v-col class="pb-0">
                    <p class="caption mb-0" style="color: grey">Skill</p>
                    <v-text-field v-model="items.skill" @input="onInputChange(i, 'Skill')" density="compact" variant="solo" />
                  </v-col>
                  <v-col>
                    <p class="caption mb-0" style="color: grey">Level - {{ items.level }}</p>
                    <v-btn-toggle
                      v-model="items.level"
                      density="comfortable"
                      :base-color="getBaseColor(items.level)"
                      :color="getColor(items.level)"
                      @update:model-value="onInputChange(i, 'Level')"
                    >
                      <v-btn value="Beginner"></v-btn>
                      <v-divider
                        vertical
                        thickness="2"
                      />
                      <v-btn value="Intermediate"></v-btn>
                      <v-divider
                        vertical
                        thickness="2"
                      />
                      <v-btn value="Skillfull"></v-btn>
                      <v-divider
                        vertical
                        thickness="2"
                      />
                      <v-btn value="Experienced"></v-btn>
                      <v-divider
                        vertical
                        thickness="2"
                      />
                      <v-btn value="Expert"></v-btn>
                    </v-btn-toggle>
                  </v-col>
                  <button
                    v-if="items.from != 'Chip'"
                    class="pa-1 mr-4 pt-3"
                    @click="onDeleteSkill(i)"
                  >
                    <v-icon color="red" icon="mdi-trash-can-outline" />
                  </button>
                  <span v-if="items.from == 'Chip'" class="mx-6" />
                </v-row>
              </v-expansion-panel-text>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-col>
      </v-row>
      <v-row class="px-6 mb-4">
        <p 
          style="cursor: pointer;"
          class="text-primary"
          @click="addMoreSkills('New', '')"
          v-text="Skills.length == 0 ? '+ Add skill' : '+ Add one more skill' "
        />
      </v-row>

      <v-row class="mr-2">
        <v-spacer></v-spacer>
        <v-btn @click="handleSubmit" color="primary">Submit</v-btn>
      </v-row>
    </v-card>
    <section>
      <v-dialog v-model="dialogAddConfirmation" persistent max-width="300">
        <v-card>
          <v-card-title class="condPopupAlert body-2 font-weight-bold">
            Save CV
          </v-card-title>
          <v-card-text class="condPopupAlert body-2 font-weight-bold">
            Apakah Anda Yakin?
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn @click="dialogAddConfirmation = false" style="background-color: #FFFFFF !important;" class="black--text">
              Tidak
            </v-btn>
            <v-btn
              @click="SaveCV()"
              :loading="SaveBtn"
              :disabled="SaveBtn"
              class="primary-btn black--text"
            >
              Ya
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-dialog v-model="dialogStatus" persistent max-width="300">
        <v-card>
          <v-card-title class="condPopupAlert body-2 font-weight-bold">
            Info
          </v-card-title>
          <v-card-text class="condPopupAlert body-2 font-weight-bold">
            {{ isidialog }}
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn
              class="primary-btn black--text"
              @click="refreshPage()"
            >
              Ok
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-dialog v-model="dialogError" persistent max-width="300">
        <v-card>
          <v-card-title class="condPopupAlert body-2 font-weight-bold">
            Info
          </v-card-title>
          <v-card-text class="condPopupAlert body-2 font-weight-bold">
            {{ isidialogError }}
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn
              class="primary-btn black--text"
              @click="dialogError = false"
            >
              Ok
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </section>
  </v-container>
</template>
<script setup>
import { reactive, ref } from 'vue';
import StarterKit from '@tiptap/starter-kit';
import { EditorContent, useEditor, Editor } from '@tiptap/vue-3';
import Underline from '@tiptap/extension-underline'
import Link from '@tiptap/extension-link'
import Placeholder from '@tiptap/extension-placeholder'
import moment from 'moment';
import axios from 'axios';

const editor = reactive(useEditor({
  editorProps: {
    attributes: {
      class: 'v-border py-4 px-6 overflow-y-auto',
      style: `
        border: 1px solid #c4c4c4; 
        min-height: 12rem; 
        max-height: 12rem;
        outline: none;
      `,
    }
  },
  extensions: [
    StarterKit,
    Underline,
    Placeholder.configure({
      placeholder: "e.g. Passionate science teacher with 8+ years of experience and a track record of ...",
    }),
    Link.configure({
      openOnClick: false,
      defaultProtocol: 'https',
    }),
  ],
  content: '',
}));

const SwitchExperience = ref(false);

const EmploymentHistory = reactive([]);

const Education = reactive([]);

const Skills = reactive([]);

const dialogAddConfirmation = ref(false);
const SaveBtn = ref(false);
const dialogStatus = ref(false);
const isidialog = ref("");

const dialogError = ref(false);
const isidialogError = ref("");

const fileInput = ref(null);
const imageUrl = ref(null);

const SkillList = ref([
  { name: "Java", isActive: false },
  { name: "JavaScript", isActive: false },
  { name: "Python", isActive: false },
  { name: "Git", isActive: false },
  { name: "SQL", isActive: false },
  { name: "C++", isActive: false },
  { name: "TypeScript", isActive: false },
  { name: "C#", isActive: false },
  { name: "Docker", isActive: false },
  { name: "PHP", isActive: false },
  { name: "React", isActive: false },
  { name: "MongoDB", isActive: false },
  { name: "Toad", isActive: false },
  { name: "HTML CSS 3", isActive: false },
  { name: "MS SQL Server", isActive: false },
]);

function getEditorValue(editorInstance) {
  if (editorInstance) {
    const htmlContent = editorInstance.value.getHTML();  // Get content as HTML

    return htmlContent;
  }
  return "";
}

function getEditorValue1(editorInstance) {
  if (editorInstance) {
    const htmlContent = editorInstance.getHTML();  // Get content as HTML

    return htmlContent;
  }
  return "";
}

const form = reactive({
  wantedJobTitle: '',
  foto: '',
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  country: '',
  city: '',
  address: '',
  postalCode: '',
  drivingLicense: '',
  nationality: '',
  placeOfBirth: '',
  dateOfBirth: null,
});

const errors = reactive({
  wantedJobTitle: '',
  firstName: '',
  email: '',
  phone: '',
  country: '',
  city: '',
  address: '',
  postalCode: '',
  drivingLicense: '',
  nationality: '',
  placeOfBirth: '',
  dateOfBirth: '',
});

// Add Form
const addMoreEmployment = () => {
  const newEditor = {
    employmenthistory: "",
    jobtitle: "",
    employer: "",
    date: "",
    startdate: "",
    enddate: "",
    city: "",
    errors: {
      jobtitle: "",
      employer: "",
      date: "",
      startdate: "",
      enddate: "",
      city: "",
    },
    editorInstance: null,
    characterCount: 0
  };
  
  newEditor.editorInstance = new Editor
  ({
    editorProps: {
      attributes: {
        class: 'v-border pa-4 overflow-y-auto',
        style: `
          border: 1px solid #c4c4c4; 
          min-height: 12rem; 
          max-height: 12rem;
          outline: none;=
        `,
      }
    },
    extensions: [
      StarterKit,
      Underline,
      Placeholder.configure({
        placeholder: "",
      }),
      Link.configure({
        openOnClick: false,
        defaultProtocol: 'https',
      }),
    ],
    content: '',
    onUpdate({ editor }) {
      const textContent = editor.getText();
      newEditor.characterCount = textContent.length;
    }
  });
  EmploymentHistory.push(newEditor);
};

const addMoreEducation = () => {
  const newEditor = {
    education: "",
    school: "",
    degree: "",
    date: "",
    startdate: "",
    enddate: "",
    city: "",
    errors: {
      jobtitle: "",
      employer: "",
      date: "",
      startdate: "",
      enddate: "",
      city: "",
    },
    editorInstance: null,
    characterCount: 0
  };
  
  newEditor.editorInstance = new Editor
  ({
    editorProps: {
      attributes: {
        class: 'v-border pa-4 overflow-y-auto',
        style: `
          border: 1px solid #c4c4c4; 
          min-height: 12rem; 
          max-height: 12rem;
          outline: none;
        `,
      }
    },
    extensions: [
      StarterKit,
      Underline,
      Placeholder.configure({
        placeholder: "",
      }),
      Link.configure({
        openOnClick: false,
        defaultProtocol: 'https',
      }),
    ],
    content: '',
    onUpdate({ editor }) {
      const textContent = editor.getText();
      newEditor.characterCount = textContent.length;
    }
  });
  Education.push(newEditor);
};

const addMoreSkills = (type, name) => {
  if(type === "New") {
    Skills.push({
      skilltitle: "",
      skill: "",
      level: "Skillfull",
      levelskill: "Skillfull",
      from: "New",
    });
  } else {
    Skills.push({
      skilltitle: name,
      skill: name,
      level: "Skillfull",
      levelskill: "Skillfull",
      from: "Chip",
    });
  }
  console.log(Skills)
};

const AddSkill = (i) => {
  console.log(SkillList.value[i]);
  const index = Skills.findIndex(item => item.skill === SkillList.value[i].name);
  if(SkillList.value[i].isActive == false) {
    Skills.splice(index, 1);
  }
  else {
    addMoreSkills("Choose", SkillList.value[i].name)
  }
};

function getCharacterCount(editorInstance) {
  const textContent = editorInstance.getText();
  const characterCount = textContent.length;
  return characterCount;
}

const validateEmail = () => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  errors.email = form.email ? (emailRegex.test(form.email) ? '' : 'Invalid email format') : 'Email is required';
};

const validatePhone = () => {
  const phoneRegex = /^[0-9]*$/;
  if (!form.phone) {
    errors.phone = 'Phone number is required';
  } else if (!phoneRegex.test(form.phone)) {
    errors.phone = 'Phone number must contain only numbers';
  } else if (form.phone.length < 12 || form.phone.length > 14) {
    errors.phone = 'Phone number length must be 12-14 digits';
  } else {
    errors.phone = '';
  }
};

const validateField = (field, fieldName) => {
  errors[field] = form[field] ? '' : `${fieldName} is required`;
};

const onInputChange = (index, fieldName) => {
  console.log("masuk");
  switch (fieldName) {
    // Employee
    case "Job Title":
      EmploymentHistory[index].employmenthistory = EmploymentHistory[index].jobtitle;
      break;
    case "Employer":
      if(EmploymentHistory[index].employer == '')
        EmploymentHistory[index].employmenthistory = EmploymentHistory[index].jobtitle;
      else 
        EmploymentHistory[index].employmenthistory = EmploymentHistory[index].jobtitle + " at " + EmploymentHistory[index].employer;
      break;
    case "Start Date":
      EmploymentHistory[index].date = moment(EmploymentHistory[index].startdate, 'MM/YYYY').format('MMM YYYY').toString();
      break;
    case "End Date":
    EmploymentHistory[index].date = moment(EmploymentHistory[index].startdate, 'MM/YYYY').format('MMM YYYY').toString() + " - " + moment(EmploymentHistory[index].enddate, 'MM/YYYY').format('MMM YYYY').toString();
      break;

    // Education
    case "School":
      Education[index].education = Education[index].school;
      break;
    case "Degree":
      if(Education[index].degree == '') {
        Education[index].education = Education[index].school
      }
      else {
        Education[index].education = Education[index].degree + " Degree at " + Education[index].school;
      }
      break;
    case "Start Date Edu":
      Education[index].date = moment(Education[index].startdate, 'MM/YYYY').format('MMM YYYY').toString();
      break;
    case "End Date Edu":
      Education[index].date = moment(Education[index].startdate, 'MM/YYYY').format('MMM YYYY').toString() + " - " + moment(Education[index].enddate, 'MM/YYYY').format('MMM YYYY').toString();
      break;

    // Skills
    case "Skill":
      Skills[index].skilltitle = Skills[index].skill;
      break;
    case "Level":
      Skills[index].levelskill = Skills[index].level;
      break;
  }
};

const onDeleteForm = (fieldName) => {
  switch (fieldName) {
    case "Employment History":
      EmploymentHistory.splice(EmploymentHistory.length - 1, 1);
      break;
    case "Education":
      Education.splice(Education.length - 1, 1);
      break;
  }
}

const onDeleteSkill = (i) => {
  Skills.splice(i, 1);
};

const getBaseColor = (level) => {
  switch (level) {
    case 'Beginner':
      return '#ffcccc';
    case 'Intermediate':
      return '#ffd699';
    case 'Skillfull':
      return '#ffcc80';
    case 'Experienced':
      return '#b3e6b3';
    case 'Expert':
      return '#d1c4e9';
    default:
      return '#e0e0e0';
  }
};

const getColor = (level) => {
  switch (level) {
    case 'Beginner':
      return 'red'; 
    case 'Intermediate':
      return 'yellow';
    case 'Skillfull':
      return 'orange';
    case 'Experienced':
      return 'green';
    case 'Expert':
      return 'purple';
    default:
      return 'grey';
  }
};

const triggerFileInput = () => {
  fileInput.value.click();
};

const onFileChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = (e) => {
      imageUrl.value = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const handleSubmit = () => {
  console.log(getEditorValue(editor));
  validateField('wantedJobTitle', 'Wanted Job Title');
  validateField('firstName', 'First Name');
  validateField('country', 'Country');
  validateField('city', 'City');
  validateField('address', 'Address');
  validateField('postalCode', 'Postal Code');
  validateField('drivingLicense', 'Driving License');
  validateField('nationality', 'Nationality');
  validateField('placeOfBirth', 'Place of Birth');
  validateField('dateOfBirth', 'Date of Birth');
  validateEmail();
  validatePhone();

  const hasErrors = Object.values(errors).some((error) => error !== '');
  if (!hasErrors) {
    dialogAddConfirmation.value = true
  }
};

const SaveCV = async () => {
  SaveBtn.value = true;
  const personalDetails = {
    WantedJobTitle: form.wantedJobTitle,
    Photo: imageUrl.value,
    FirstName: form.firstName,
    LastName: form.lastName,
    Email: form.email,
    Phone: form.phone,
    Country: form.country,
    City: form.city,
    Address: form.address,
    PostalCode: form.postalCode,
    DrivingLicense: form.drivingLicense,
    Nationality: form.nationality,
    PlaceOfBirth: form.placeOfBirth,
    DateOfBirth: form.dateOfBirth,
    ProfessionalSummary: getEditorValue(editor),
  }
  const employmentHistory = [];
  const education = [];
  const skills = [];

  EmploymentHistory.map((item) => {
    employmentHistory.push({
      JobTitle: item.jobtitle,
      Employer: item.employer,
      StartDate: item.startdate,
      EndDate: item.enddate,
      City: item.city,
      Description: getEditorValue1(item.editorInstance)
    })
  })

  Education.map((item) => {
    education.push({
      School: item.school,
      Degree: item.degree,
      StartDate: item.startdate,
      EndDate: item.enddate,
      City: item.city,
      Description: getEditorValue1(item.editorInstance)
    })
  })

  Skills.map((item) => {
    skills.push({
      SkillName: item.skill,
      SkillLevel: item.level,
    })
  })
  
  const completeCV = {
    personalDetails: personalDetails,
    employmentHistory: employmentHistory,
    education: education,
    skills: skills
  };

  try {
    const response = await axios.post(
      'https://localhost:7219/api/CV/InsertCompleteCV',
      completeCV
    );
    if(response.data.message === "Berhasil Save Data") {
      dialogAddConfirmation.value = false;
      dialogStatus.value = true;
      isidialog.value = "Success Save Data";
    }
    else {
      dialogAddConfirmation.value = false;
      dialogError.value = true;
      isidialogError.value = "Failed to Save Data";
    }
  } catch (error) {
    dialogAddConfirmation.value = false;
    dialogError.value = true;
    isidialogError.value = 'Error saving CV:' + error.response ? error.response.data : error.message;
    console.error('Error saving CV:', error.response ? error.response.data : error.message);
  }
};

const refreshPage = () => {
  window.location.reload();
};
</script>

<style scoped>
.error-label {
  color: red !important;
}
.text-danger {
  color: red;
}
.v-btn {
  text-transform: none;
}
</style>