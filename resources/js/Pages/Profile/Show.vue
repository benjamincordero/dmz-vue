<template>
    <app-layout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Profile
            </h2>
        </template>

        <div>
            <div class="max-w-7xl mx-auto py-10 sm:px-6 lg:px-8">
                <logout-other-browser-sessions-form :sessions="sessions" class="mb-10 sm:mt-0" />

                <update-profile-information-form
                            :name="$page.user.name"
                            :email="$page.user.email" />

                <section-border />

                <update-password-form class="mt-10 sm:mt-0" />

                <div v-if="$page.jetstream.canManageTwoFactorAuthentication">
                    <section-border />

                    <two-factor-authentication-form class="mt-10 sm:mt-0" />
                </div>

                <section-border />


                <section-border />

                <delete-user-form class="mt-10 sm:mt-0" />
            </div>
        </div>
    </app-layout>
</template>

<script>
    import AppLayout from './../../Layouts/AppLayout'
    import DeleteUserForm from './DeleteUserForm'
    import SectionBorder from './../../components/SectionBorder'
    import LogoutOtherBrowserSessionsForm from './LogoutOtherBrowserSessionsForm'
    import TwoFactorAuthenticationForm from './TwoFactorAuthenticationForm'
    import UpdatePasswordForm from './UpdatePasswordForm'
    import UpdateProfileInformationForm from './UpdateProfileInformationForm'

    export default {
        props: ['sessions'],

        components: {
            AppLayout,
            DeleteUserForm,
            SectionBorder,
            LogoutOtherBrowserSessionsForm,
            TwoFactorAuthenticationForm,
            UpdatePasswordForm,
            UpdateProfileInformationForm,
        },
    }
</script>
